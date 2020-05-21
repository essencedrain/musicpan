<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
     <!-- Popper.JS -->
    <script src="/resources/js/popper.min.js"></script>
    <!-- Bootstrap JS -->
    <script src="/resources/js/bootstrap.min.js"></script>
    <!-- jQuery Custom Scroller  -->
    <script src="/resources/js/jquery.mCustomScrollbar.concat.min.js"></script>
    <!--  sweetalert2 js file  -->
    <script src="/resources/js/sweetalert2.min.js"></script>
    <!--  wow js file  -->
    <script src="/resources/js/wow.js"></script>
    <script>
        new WOW().init();
    </script>
    
    <!-- =================================================================================================  -->
    <!-- 사이드바  -->
    <!-- =================================================================================================  -->
    <script type="text/javascript">
        $(document).ready(function () {
            $("#sidebar").mCustomScrollbar({
                theme: "minimal"
            });

            $('#dismiss, .overlay').on('click', function () {
                $('#sidebar').removeClass('active');
                $('.overlay').removeClass('active');
            });

            $('#sidebarCollapse').on('click', function () {
                $('#sidebar').addClass('active');
                $('.overlay').addClass('active');
                $('.collapse.in').toggleClass('in');
                $('a[aria-expanded=true]').attr('aria-expanded', 'false');
            });
        });
    </script>
    <!-- =================================================================================================  -->
</body>

</html>
