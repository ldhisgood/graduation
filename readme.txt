命名规则：
	后台：
	实体类名与数据库相同            t_user  TUser
	action			userAction
	service			IUserService    UserService
	dao				IUserDao		UserDao
	
	action中的请求：
	类上加   user(表名不要t小写)
	分页展示	list.do
	保存		save.do
	更新		update.do
	删除		del.do
	
	前台：
	每一个放到一个文件中，文件夹名称为实体名  user(表名不要t小写)
	展示页面	list.jsp
		到达显示页面		user/Go.do
		显示的盒子		userListBox
		
	保存页面	save.jsp
		到达保存页面		user/saveGo.do
		新增的盒子		userSaveBox
		新增的form盒子	userSaveForm
		提交form的按键	userSaveBtn
		返回按键		userSaveExit
		
	修改页面	edit.jsp
		修改页面的对象叫做bean
		到达修改盒子		user/EditGo.do
		修改的盒子		userEditBox
		修改的form		userEditForm
		提交form的按键	userEditBtn
		返回按键		userEditExit
	
	选择文本框  id为chooseEquipCateInp   其中EquipCate是哪个类
	
	
登陆地址：http://localhost:8080/graduation
默认用户：admin/admin
数据库：mysql，导入graduation.sql即可，如果不好用，可以导入bltdb（这里具有更多数据）