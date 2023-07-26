<!-- ========== Left Sidebar Start ========== -->
<div class="vertical-menu">

    <div data-simplebar class="h-100">

        <!--- Sidemenu -->
        <div id="sidebar-menu">
            <!-- Left Menu Start -->
            <ul class="metismenu list-unstyled" id="side-menu">

                <?php
                    
                   if (Auth::guard('admin')->user()) {
              ?>
                
                <li>
                    <a href="{{ route('users.index') }}" class="waves-effect">
                        <i class="fas fa-users"></i>
                        <span key="t-users">users</span>
                    </a>
                </li>
                {{-- <li>
                    <a href="{{ route('area.index') }}" class="waves-effect">
                        <i class="bx bx-map-alt"></i>
                        <span key="t-services">Area</span>
                    </a>
                </li> --}}
                <li>
                    <a href="{{ route('buildings.index') }}" class="waves-effect">
                        <i class="far fa-building"></i>
                        <span key="t-building">Buildings</span>
                    </a>
                </li>
                <li>
                    <a href="{{ route('plan.index') }}" class="waves-effect">
                        <i class="bx bxs-carousel"></i>
                        <span key="t-building">Plans</span>
                    </a>
                </li>
                <li>
                    <a href="{{ route('services.index') }}" class="waves-effect">
                        <i class="fas fa-users-cog"></i>
                        <span key="t-services">Services</span>
                    </a>
                </li>

                <li>
                    <a href="{{ route('categories.index') }}" class="waves-effect">
                        <i class="bx bx-windows"></i>
                        <span key="t-categories">categories</span>
                    </a>
                </li>
                {{-- <li>
                    <a href="{{ route('subcategories.index') }}" class="waves-effect">
                        <i class="bx bx-sort-down"></i>
                        <span key="t-subServices">subcategories</span>
                    </a>
                </li>
                <li>
                    <a href="#" class="waves-effect">
                        <i class="mdi mdi-wallet-membership"></i>
                        <span key="t-services">Membership</span>
                    </a>
                </li> --}}

                <li>
                    <a href="#" class="waves-effect">
                        <i class="bx bx-store"></i>
                        <span key="t-services">orders</span>
                    </a>
                </li>
                <li>
                    <a href="{{ route('staff.index') }}" class="waves-effect">
                        <i class="dripicons-user-group"></i>
                        <span key="t-services">staff</span>
                    </a>
                </li>
                {{-- <li>
                    <a href="javascript: void(0);" class="has-arrow waves-effect">
                        <i class="bx bx-store"></i>
                        <span key="t-ecommerce">Orders</span>
                    </a>
                    <ul class="sub-menu" aria-expanded="false">
                        <li><a href="{{ route('orders.index') }}" key="t-products">orders</a></li>
                        <li><a href="{{ route('all.orders') }}" key="t-product-detail">All orders item</a></li>
                        
                        
                    </ul>
                </li>
                <li>
                    <a href="{{ route('calendar') }}" class="waves-effect">
                        <i class="bx bx-calendar"></i>
                        <span key="t-calendar">Calendar</span>
                    </a>
                </li> --}}
                <li>
                    <a href="javascript: void(0);" class="has-arrow waves-effect">
                        <i class="bx bx-cog"></i>
                        <span key="t-ecommerce">Configration</span>
                    </a>
                    <ul class="sub-menu" aria-expanded="false">
                        <li><a href="{{ route('notification.index') }}" key="t-products">User Notification</a></li>
                        <li><a href="{{ route('time-slote.index') }}" key="t-product-detail">Time Slotes</a></li>
                        <li><a href="ecommerce-product-detail" key="t-product-detail">Admin Profile</a></li>
                        <li><a href="{{ route('visitor-area.index') }}" key="t-product-detail">Area Added By
                                Visitors</a></li>
                    </ul>
                </li>

                <?php 
                   }
                  
                   if (Auth::guard('group_building')->user()) {
              ?>
                <li>
                    <a href="{{ route('building.building') }}" class="waves-effect">
                        <i class="dripicons-user-group"></i>
                        <span key="t-services">Buildings</span>
                    </a>
                </li>
                <li>
                    <a href="{{ route('building.user') }}" class="waves-effect">
                        <i class="dripicons-user-group"></i>
                        <span key="t-services">Residents</span>
                    </a>
                </li>
                <li>
                    <a href="{{ route('building.facility.bookings') }}" class="waves-effect">
                        <i class="bx bxs-calendar-plus"></i>
                        <span key="t-services">Bookings</span>
                    </a>
                </li>
                <li>
                    <a href="{{ route('building.facility') }}" class="waves-effect">
                        <i class="bx bxs-building-house"></i>
                        <span key="t-services">Facilities</span>
                    </a>
                </li>
                <li>
                    <a href="{{ route('building.log') }}" class="waves-effect">
                        <i class="bx bxs-notepad"></i>
                        <span key="t-services">Log</span>
                    </a>
                </li>
                <?php }?>




            </ul>
        </div>
        <!-- Sidebar -->
    </div>
</div>
<!-- Left Sidebar End -->
