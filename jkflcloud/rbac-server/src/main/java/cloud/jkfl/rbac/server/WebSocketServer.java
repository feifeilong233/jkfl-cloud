package cloud.jkfl.rbac.server;


import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import javax.websocket.*;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.concurrent.CopyOnWriteArraySet;

@Slf4j
@ServerEndpoint(value = "/websocket")
@Component
public class WebSocketServer {
    // 用来记录当前连接数的变量
    private static volatile int onlineCount = 0;

    // 线程安全Set，用来存放每个客户端对应的 WebSocket 对象
    private static CopyOnWriteArraySet<WebSocketServer> webSocketSet = new CopyOnWriteArraySet<>();

    // 与某个客户端的连接会话，需要通过它来给客户端发送数据
    private Session session;

    /**
     * 连接建立成功调用的方法
     * @param session 连接会话
     */
    @OnOpen
    public void onOpen(Session session) {
        this.session = session;
        // 加入set中
        webSocketSet.add(this);
        // 连接数加1
        addOnlineCount();
        log.info("有新连接，当前连接数为" + getOnlineCount());
        try {
            sendMessage("连接成功");
        } catch (IOException e) {
            log.error("websocket IO异常");
        }
    }

    /**
     * 连接关闭调用的方法
     */
    @OnClose
    public void onClose() {
        // 从set中删除
        webSocketSet.remove(this);
        // 连接数减1
        subOnlineCount();
        log.info("有一连接关闭！当前连接数为：" + getOnlineCount());
    }

    /**
     * 收到客户端消息后调用的方法
     *
     * @param message 消息
     * @param session 连接会话
     */
    @OnMessage
    public void onMessage(String message, Session session) {
        log.info("收到来自客户端的消息：" + message);

        // 群发消息
        for (WebSocketServer item : webSocketSet) {
            try {
                item.sendMessage(message);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    /**
     * 发生错误时调用的方法
     *
     * @param session 连接会话
     * @param error 错误信息
     */
    @OnError
    public void onError(Session session, Throwable error) {
        log.error("发送错误");
        error.printStackTrace();
    }

    /**
     * 实现服务器主动推送消息
     *
     * @param message 消息
     * @throws IOException
     */
    public void sendMessage(String message) throws IOException {
        this.session.getBasicRemote().sendText(message);
    }

    /**
     * 群发自定义消息
     *
     * @param message 自定义消息
     * @throws IOException
     */
    public static void sendInfo(String message) throws IOException {
        log.info("推送消息内容："+message);
        for (WebSocketServer item : webSocketSet) {
            try {
                item.sendMessage(message);
            } catch (IOException e) {
                continue;
            }
        }
    }

    /**
     * 获取连接数
     * @return 连接数
     */
    private static synchronized int getOnlineCount() {
        return onlineCount;
    }

    /**
     * 连接数加1
     */
    private static synchronized void addOnlineCount() {
        WebSocketServer.onlineCount++;
    }

    /**
     * 连接数减1
     */
    private static synchronized void subOnlineCount() {
        WebSocketServer.onlineCount--;
    }

}
