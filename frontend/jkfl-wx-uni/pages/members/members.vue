<template>
	<view class="page">
		<checkbox-group @change="selected">
			<block v-for="dept in list" :key='dept.id'>
				<view class="list-title">{{dept.deptName}} （{{dept.count}}人）</view>
				<view v-for="member in dept.members" class="item" :key="member.userId">
					<view class="key">{{member.name}}</view>
					<checkbox class="value" :value="member.userId" :checked="member.checked"></checkbox>
				</view>
			</block>
		</checkbox-group>
	</view>
	
</template>

<script>
export default{
	data(){
		return{
			list: [],
			members: []
		}
	},
	onShow:function(){
		this.loadData(this);
	},
	onLoad:function(options){
		if(options.hasOwnProperty("members")){
			let members = options.members;
			this.members = members.split(",");
		}
	},
	methods:{
		loadData:function(ref){
			ref.ajax(ref.url.searchUserGroupByDept, "POST", {keyword:ref.keyword},function(resp){
				let result = resp.data.result;
				ref.list = result;
				for(let dept of ref.list){
					for(let member of dept.members){
						if(ref.members.indexOf(member.userId+'')!=-1){
							member.checked = true;
						}
						else{
							member.checked = false;
						}
					}
				}
			})
		},
		selected:function(e){
			let that = this;
			that.members = e.detail.value;
			let pages = getCurrentPages();
			let prePage = pages[pages.length - 2];
			prePage.members = that.members;
			prePage.finishMembers = true;
			
		}
	}
}
</script>

<style lang="less">
	@import url('members.less');
</style>