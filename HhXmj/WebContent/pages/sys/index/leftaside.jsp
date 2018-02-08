 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- Sidebar user panel -->
<!--       <div class="user-panel"> -->
<!--         <div class="pull-left image"> -->
<!--           <img src="dist/img/user2-160x160.jpg" class="img-circle" alt="User Image"> -->
<!--         </div> -->
<!--         <div class="pull-left info"> -->
<!--           <p>Alexander Pierce</p> -->
<!--           <a href="#"><i class="fa fa-circle text-success"></i> Online</a> -->
<!--         </div> -->
<!--       </div> -->
      <!-- search form -->
<!--       <form action="#" method="get" class="sidebar-form"> -->
<!--         <div class="input-group"> -->
<!--           <input type="text" name="q" class="form-control" placeholder="Search..."> -->
<!--               <span class="input-group-btn"> -->
<!--                 <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i> -->
<!--                 </button> -->
<!--               </span> -->
<!--         </div> -->
<!--       </form> -->
      <!-- /.search form -->
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu">
        <li class="header">用户导航</li>
        <c:forEach var="sysMenuTreeP" items="${sysMenuTrees}" varStatus="status">
        	<li class="treeview">
		          <a href="javascript:void(0)">
		            <i class="fa fa-dashboard"></i> <span>${sysMenuTreeP.sys_menu_name}</span>
		            <span class="pull-right-container">
		              <i class="fa fa-angle-left pull-right"></i>
		            </span>
		          </a>
		          <ul class="treeview-menu">
		        	 <c:forEach var="sysMenuTreeC" items="${sysMenuTreeP.children}" varStatus="status">
		        		<li><a style="cursor:pointer;" target="indexFrame"  href="${sysMenuTreeC.sys_menu_url}" onclick=""><i class="fa fa-circle-o"></i>${sysMenuTreeC.sys_menu_name}</a></li>
					 </c:forEach>
				  </ul>
		     </li>
		</c:forEach>
      </ul>
    </section>
    <!-- /.sidebar -->
  </aside>