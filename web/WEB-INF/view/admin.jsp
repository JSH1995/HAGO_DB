<!doctype html>
<html lang="en">

<head>

    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=1040">

    <title>Bootstrap 4 Carousel with Multiple Items</title>

    <jsp:include page="../../common/style.jsp" flush="false"/>
    <jsp:include page="../../common/theme.jsp" flush="false"/>
    <jsp:include page="../../common/font.jsp" flush="false"/>
    <link href="../../resources/css/carousel/all.css" rel="stylesheet" type="text/css"/>
    <script src="../../resources/js/main.js" type="text/javascript"></script>
    <!-- Favicon and touch icons -->
</head>

<body>
<script>
    $('.carousel.carousel-multi-item.v-2 .carousel-item').each(function(){
        var next = $(this).next();
        if (!next.length) {
            next = $(this).siblings(':first');
        }
        next.children(':first-child').clone().appendTo($(this));

        for (var i=0;i<4;i++) {
            next=next.next();
            if (!next.length) {
                next=$(this).siblings(':first');
            }
            next.children(':first-child').clone().appendTo($(this));
        }
    });

</script>
</body>

</html>