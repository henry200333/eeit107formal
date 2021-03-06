<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
	<!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

      <!-- Sidebar - Brand -->
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/index">
        <div class="sidebar-brand-icon rotate-n-15">
          <i class="fas fa-fw fa-guitar"></i>

        </div>

        <div class="sidebar-brand-text mx-3">JAYEE<sup> 1.0</sup></div>
      </a>

      <!-- Divider -->
      <hr class="sidebar-divider">
	   
      <!-- Heading -->
      <div class="sidebar-heading" >
        Security
      </div>
      
      <!-- Nav Item - User -->
      <li id="navUser" class="nav-item">
        <a class="nav-link" href="/admin/securityUser/list">
          <i class="fas fa-fw fa-users"></i>
          <span style="font-family: 'Noto Sans TC', sans-serif;">用戶管理</span></a>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- Heading -->
      <div class="sidebar-heading">
        Entities
      </div>

      <!-- Nav Item - Activity -->
      <li id="navActivity" class="nav-item">
        <a class="nav-link" href="/admin/activity/list">
          <i class="fas fa-fw fa-glass-cheers"></i>
          <span style="font-family: 'Noto Sans TC', sans-serif;">活動管理</span>
        </a>
      </li>

      <!-- Nav Item - Performance -->
      <li id="navPerformance" class="nav-item">
        <a class="nav-link" href="/admin/performance/list">
          <i class="fas fa-fw fa-film"></i>
          <span style="font-family: 'Noto Sans TC', sans-serif;">表演管理</span>
        </a>
      </li>

      <!-- Nav Item - Vender -->
      <li id="navVender" class="nav-item">
        <a class="nav-link" href="/admin/vender/list">
          <i class="fas fa-fw fa-hands-helping"></i>
          <span style="font-family: 'Noto Sans TC', sans-serif;">廠商管理</span>
        </a>
      </li>

      <!-- Nav Item - Article -->
      <li id="navArticle" class="nav-item">
        <a class="nav-link" href="/admin/article/list">
          <i class="fas fa-fw fa-newspaper"></i>
          <span style="font-family: 'Noto Sans TC', sans-serif;">文章管理</span></a>
      </li>

      <!-- Nav Item - Forum -->
      <li id="navForum" class="nav-item">
        <a class="nav-link" href="/admin/forum/list">
          <i class="fas fa-fw fa-comments"></i>
          <span style="font-family: 'Noto Sans TC', sans-serif;">留言管理</span></a>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider d-none d-md-block">

      <!-- Sidebar Toggler (Sidebar) -->
      <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
      </div>

    </ul>
    <!-- End of Sidebar -->