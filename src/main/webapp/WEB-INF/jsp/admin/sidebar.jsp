<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
	<!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

      <!-- Sidebar - Brand -->
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/admin/artist/list">
        <div class="sidebar-brand-icon rotate-n-15">
          <i class="fas fa-fw fa-guitar"></i>
        </div>
        <div class="sidebar-brand-text mx-3">JAYEE<sup> 1.0</sup></div>
      </a>

      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- Heading -->
      <div class="sidebar-heading">
        Entities
      </div>

      <!-- Nav Item - Artist -->
      <li class="nav-item">
        <a class="nav-link" href="/admin/artist/list">
          <i class="fas fa-fw fa-users"></i>
          <span>Artist</span></a>
      </li>

      <!-- Nav Item - Activity -->
      <li class="nav-item">
        <a class="nav-link" href="/admin/activity/list">
          <i class="fas fa-fw fa-calendar-alt"></i>
          <span>Activity</span>
        </a>
      </li>

      <!-- Nav Item - Performance -->
      <li class="nav-item">
        <a class="nav-link" href="/admin/performance/list">
          <i class="fas fa-fw fa-film"></i>
          <span>Performance</span>
        </a>
      </li>

      <!-- Nav Item - Vender -->
      <li class="nav-item">
        <a class="nav-link" href="/admin/vender/list">
          <i class="fas fa-fw fa-dollar-sign"></i>
          <span>Vender</span>
        </a>
      </li>

      <!-- Nav Item - Article -->
      <li class="nav-item">
        <a class="nav-link" href="/admin/article/list">
          <i class="fas fa-fw fa-file-alt"></i>
          <span>Article</span></a>
      </li>

      <!-- Nav Item - Forum -->
      <li class="nav-item">
        <a class="nav-link" href="/admin/forum/list">
          <i class="fas fa-fw fa-comments"></i>
          <span>Forum</span></a>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider d-none d-md-block">

      <!-- Sidebar Toggler (Sidebar) -->
      <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
      </div>

    </ul>
    <!-- End of Sidebar -->