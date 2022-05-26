package cloud.jkfl.teach.controller;

import cloud.jkfl.teach.pojo.EduChapter;
import cloud.jkfl.teach.pojo.EduExtInfo;
import cloud.jkfl.teach.pojo.EduNovel;
import cloud.jkfl.teach.pojo.EduUserBook;
import cloud.jkfl.teach.pojo.vo.ChapterVo;
import cloud.jkfl.teach.pojo.vo.EduChapterBlobVo;
import cloud.jkfl.teach.service.impl.EduChapterServiceImpl;
import cloud.jkfl.teach.service.impl.EduExtInfoServiceImpl;
import cloud.jkfl.teach.service.impl.EduNovelServiceImpl;
import cloud.jkfl.teach.service.impl.EduUserBookServiceImpl;
import org.apache.pdfbox.io.RandomAccessBuffer;
import org.apache.pdfbox.pdfparser.PDFParser;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.PDDocumentInformation;
import org.apache.pdfbox.pdmodel.interactive.action.PDActionGoTo;
import org.apache.pdfbox.pdmodel.interactive.documentnavigation.destination.PDPageDestination;
import org.apache.pdfbox.pdmodel.interactive.documentnavigation.outline.PDDocumentOutline;
import org.apache.pdfbox.pdmodel.interactive.documentnavigation.outline.PDOutlineItem;
import org.apache.pdfbox.pdmodel.interactive.documentnavigation.outline.PDOutlineNode;
import org.apache.pdfbox.text.PDFTextStripper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.*;

@CrossOrigin
@RestController
@RequestMapping("/teach")
public class PDFController {

    @Autowired
    private EduChapterServiceImpl chapterService;

    @Autowired
    private EduExtInfoServiceImpl extInfoService;

    @Autowired
    private EduNovelServiceImpl novelService;

    @Autowired
    private EduUserBookServiceImpl userBookService;

    public static Map<String, Integer> printBookmarks(PDOutlineNode bookmark, String indentation) throws IOException {

        Map<String, Integer> map = new LinkedHashMap<>();

        PDOutlineItem current = bookmark.getFirstChild();

        while(current != null){
            int pages = 0;

            if(current.getDestination() instanceof PDPageDestination){
                PDPageDestination pd = (PDPageDestination) current.getDestination();
                pages = pd.retrievePageNumber() + 1;
            }
            if (current.getAction()  instanceof PDActionGoTo) {
                PDActionGoTo gta = (PDActionGoTo) current.getAction();
                if (gta.getDestination() instanceof PDPageDestination) {
                    PDPageDestination pd = (PDPageDestination) gta.getDestination();
                    pages = pd.retrievePageNumber() + 1;
                }
            }

            if (pages == 0) {
                //这里就是太少了，每测出来，那就全算一页
                System.out.println(indentation+current.getTitle());
                map.put(current.getTitle(), pages);
            }else{
                //这里就是正常测出来的情况
                System.out.println(indentation+current.getTitle()+"  "+pages);
                map.put(current.getTitle(), pages);
            }

            printBookmarks( current, indentation + "    " );
            current = current.getNextSibling();
        }


        return map;
    }

    @RequestMapping("/pdfAnalysis")
    public String PDF_Analysis(){

        Map<String,Integer> map = null;
        File file = new File("Z:\\c.pdf");
        PDDocument doc = null;
        FileInputStream fis = null;
        try {
            fis = new FileInputStream(file);
            PDFParser parser = new PDFParser(new RandomAccessBuffer(fis));
            parser.parse();
            doc = parser.getPDDocument();

            PDDocumentOutline outline = doc.getDocumentCatalog().getDocumentOutline();
            if (outline != null) {
                //这是测出有书签的
                map = printBookmarks(outline, "");
            }else{
                //这都是测出来没有书签的
                map = new LinkedHashMap<>();
                //得到一共多少页
                int numberOfPages = doc.getNumberOfPages();
                int end = numberOfPages / 10;
                for (int i = 0; i <= end; i++){
                    if (i < end)
                        map.put("第"+(i+1)+"章",10);
                    else
                        map.put("第"+(i+1)+"章",numberOfPages - i*10);
                }
            }
            PDDocumentInformation pdi = doc.getDocumentInformation();

            /**
             * 先添加Novel，以为Novel是预览信息，只需要添加一次
             * */
            //先创建出novel，否则插chapter没有novel_id
            EduNovel novel = new EduNovel();
            novel.setNovelId( UUID.randomUUID().toString().replaceAll("-", "") );
            novel.setNovelTitle(pdi.getTitle());
            novel.setNovelType("工具书");
            novel.setNovelFormat("PDF");
            boolean save_novel = novelService.save(novel);
            if (!save_novel)
                return "Novel添加失败";

            /**
             * 再创建ext-info，以为是伴生表没有额外逻辑可以直接添加
             * */
            EduExtInfo extInfo = new EduExtInfo();
            extInfo.setNovelId(novel.getNovelId());
            extInfo.setExtClick(0);
            extInfo.setExtCollection(0);
            extInfo.setExtDownload(0);
            boolean save_extInfo = extInfoService.save(extInfo);
            if (!save_extInfo)
                return "Ext Info添加失败";


            /**
             * 开始按章节解析pdf内容，然后在每次遍历中不断插入数据库
             * */
            // 新建一个PDF文本剥离器
            PDFTextStripper stripper = new PDFTextStripper();
            //按位置进行排序
            stripper.setSortByPosition(true);
            //设置段落结尾
            stripper.setParagraphEnd("\n");

            int i = 1;//i为章节排序，以为数据库中章节是乱序的所以需要通过特殊字段排序
            int flag = 1;//按页解析的起始页，结束页为 flag+15

            //到这里map里面肯定是东西了
            for (String item : map.keySet()) {

                /**
                 * integer判断是否是否只有1页,
                 * 如果位0，则直接解析所有文本插入，否则就不停的迭代，到结束位置
                 * */
                Integer integer = map.get(item);//interger判断
                if (integer == 0){
                    //0说明就一页，全塞进content
                    String result = stripper.getText(doc);// 从PDF文档对象中剥离文本
                    EduChapter chapter = new EduChapter();
                    chapter.setChapterName(item);
                    chapter.setChapterContent(result);
                    chapter.setNovelId(novel.getNovelId());
                    chapter.setChapterSort(1);

                    boolean save_chapter = chapterService.save(chapter);
                    if (!save_chapter)
                        return "添加chapter， integer==0失败";
                }else {
                    stripper.setStartPage(flag);
                    stripper.setEndPage(flag+10-1);


                    //获取文本
                    String content_with_page = stripper.getText(doc);//按照page得到的文章

                    EduChapter chapter = new EduChapter();
                    //这边也要把chapter的id先搞出来，以为底下创建用户-novel表的时候需要插入chapterid
                    chapter.setChapterId( UUID.randomUUID().toString().replaceAll("-", "" ) );
                    chapter.setChapterName(item);
                    chapter.setChapterContent(content_with_page);
                    chapter.setNovelId(novel.getNovelId());
                    chapter.setChapterSort(i);

                    //默认为第一章
                    if (i == 1){
                        EduUserBook eduUserBook = new EduUserBook();
                        eduUserBook.setUserId("79392778a90d4639a297dbd0bae0f779");
                        eduUserBook.setNovelId(novel.getNovelId());
                        eduUserBook.setNbChapterId(chapter.getChapterId());
                        boolean save = userBookService.save(eduUserBook);
                        if (!save)
                            return "添加user-book关系表失败";
                    }


                    boolean save_chapter_page = chapterService.save(chapter);
                    if (!save_chapter_page)
                        return "添加chapter with page失败";
                    i += 1;
                    flag += 10;
                }
            }


        } catch (Exception e) {
            e.printStackTrace();
        }

        return "解析并添加成功！！！";
    }


    /**
     * 解析并添加章节内容用的
     * */
    @PostMapping("/getContentWithChapterId")
    public Map<String,Object> getContentWithChapterId(@RequestParam("userId") String userId,
                                                      @RequestParam("id") String novelId){


        EduUserBook chapter = userBookService.getChapterIdWithUN(userId, novelId);

        EduChapterBlobVo byId = chapterService.getChapterById(chapter.getNbChapterId());

        Map<String, Object> map = new HashMap<>();
        map.put("id", byId.getChapterId());
        map.put("title", byId.getChapterName());

        String content = byId.getChapterContent();
        String s = content.replaceAll("\\r\\n\\n", "");
        String str = s.replaceAll("    ","<br/>");

        String[] split = str.split("<br/>");

        map.put("content", split);

        return map;
    }

    /**
     * 查询某一章内容并且处理返回
     * */
    @PostMapping("/getAllChapter/{id}")
    public Map<String,Object> getAllChapterWithId(@PathVariable("id") String id){

        //这里只需取到Chapter的名字（章节名）和id（跳转查库）
        List<ChapterVo> vos = chapterService.getChapterWithNovelId(id);
        List<Object> list = new ArrayList<>();
        Map<String, Object> obj = new HashMap<>();

        for (ChapterVo vo : vos){
            Map<String, Object> map = new HashMap<>();
            map.put("id", vo.getChapterId());
            map.put("title", vo.getChapterName());
            list.add(map);
        }
        obj.put("chapter", list);
        return obj;
    }


    /**
     * 得到novel预览list
     * 查询的是当前用的收藏的
     * */
    @PostMapping("/getNovelListWithUId")
    public Map<String,Object> getNovelListWithUId(@RequestParam("userId") String userId){

        List<String> novels = userBookService.getNovelsWithUserId(userId);

        List<EduNovel> eduNovels = novelService.listByIds(novels);
        Map<String, Object> map = new HashMap<>();

        map.put("data", eduNovels);
        return map;
    }


    /**
     * 通过novelTitle和novelFormat来进行查找
     * */
    @PostMapping("/getListWithFT")
    public Map<String, Object> getListWithFT(@RequestParam("userId") String userId,
                                             @RequestParam("format") String format,
                                             @RequestParam("input") String input){


        List<EduNovel> list = novelService.getListWithUFI(userId, format, input);

        Map<String ,Object> map = new HashMap<>();
        map.put("data", list);
        return map;
    }

    /**
     * 用户通过点击章节跳转，需要更新user-book中的nbchapterid(书签)
     * */
    @PostMapping("/userJumpToNewChapter")
    public Map<String,Object> userJumpToNewChapter(@RequestParam("ord") String chapterId,
                                                   @RequestParam("userId") String userId,
                                                   @RequestParam("novel_id") String novelId){
        Map<String,Object> map = new HashMap<>();

        //因为chapterId是唯一的，所以直接通过byId取出来返回并更新user-book即可
        //先更新user-book
        EduUserBook chapterIdWithUN = userBookService.getChapterIdWithUN(userId, novelId);
        chapterIdWithUN.setNbChapterId(chapterId);
        boolean b = userBookService.updateById(chapterIdWithUN);
        if (!b){
            map.put("id", "数据错误");
            map.put("title", "数据错误");
            map.put("content","数据错误");
            return map;
        }

        //重复 getContentWithChapterId 操作，得到内容并返回

        EduChapterBlobVo byId = chapterService.getChapterById(chapterId);
        map.put("id", byId.getChapterId());
        map.put("title", byId.getChapterName());

        String content = byId.getChapterContent();
        String s = content.replaceAll("\\r\\n\\n", "");
        String str = s.replaceAll("    ","<br/>");

        String[] split = str.split("<br/>");

        map.put("content", split);

        return map;

    }


    /**
     * 得到market的小说列表（全部，直接查）
     */
    @PostMapping("/getMarketNovelList")
    public Map<String, Object> getMarketNovelList(){
        List<EduNovel> list = novelService.list();
        Map<String, Object> map = new HashMap<>();

        map.put("data", list);
        return map;
    }

}
