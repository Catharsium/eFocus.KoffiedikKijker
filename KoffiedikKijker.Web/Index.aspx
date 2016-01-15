<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="KoffiedikKijker.Web.Index" %>

<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=320; user-scalable=no" />
    <meta http-equiv="Content-type" content="text/html; charset=utf-8">
    <title>DE Koffiedikkijker</title>

    <script type="text/javascript" charset="utf-8" src="scripts/jquery-2.2.0.min.js"></script>

    <style>

        @font-face {
            font-family: 'MarselisSlabWeb';
            font-style: normal;
            font-weight: 400;
            src:  url('font/MarselisSlabWeb.woff') format('woff');
        }

        body {
            margin: 0;
            font-family: 'MarselisSlabWeb', sans-serif;
        }

        header {
            height: 10vh;
            padding: 0.5rem;
            box-shadow: 0 0 2px rgba(0,0,0,.5);
        }

        header img {
            height: 100%;
            margin: 0 auto;
            display: block;
        }

        h1, h2 {
            text-align: center;
            margin-left: 1rem;
            margin-right: 1rem;
        }

        ol {
            margin-left: 1rem;
            margin-right: 1rem;
            margin-bottom: 4rem;
            left: 50%;
            position: absolute;
            -webkit-transform: translateX(-50%);
            transform: translateX(-50%);
            position: relative;
        }

        #clockdiv {
            text-align: center;
            margin: 1rem;
        }

        #yourimage {
            width: 100%;
        }

        #swatches {
            width: 100%;
            height: 50px;
        }

        .swatch {
            width: 18%;
            height: 50px;
            border-style: solid;
            border-width: thin;
            float: left;
            margin-right: 3px;
        }

        /* custom file upload */

        .custom-file-upload-hidden {
            display: none;
            visibility: hidden;
            position: absolute;
            left: -9999px;
        }
        .custom-file-upload {
            display: block;
            width: auto;
            font-size: 16px;
            margin-top: 30px;
            
        }

        .custom-file-upload label {
            display: block;
            margin-bottom: 5px;
        }

        .file-upload-input {
            display: none;
        }

        .file-upload-button {
            cursor: pointer; 
            display: inline-block; 
            color: #fff;
            font-size: 16px;
            padding: 11px 20px; 
            border: none;
            background-color: #C20C0D; 
            position: relative;
            bottom: 5%;
            left: 50%;
            -webkit-transform: translateX(-50%);
            transform: translateX(-50%);
            margin-bottom: 2rem;
        }

        .file-upload-button:hover {
            background-color: darkred;
        }

        .loader, #yourimage {
            position: absolute;
            top: 50%;
            left: 50%;
            -webkit-transform: translate(-50%, -50%);
            transform: translate(-50%, -50%);
        }

        .loader {
            z-index: 2;
            animation: scale 1.5s infinite;
            color: white;
            text-shadow: 0px 4px 6px #000;
        }

        .scan-line {
            height: 2px;
            width: 100%;
            background: #C20C0D;
            position: absolute;
            top: 0;
            z-index: 1;
            border-color: #C20C0D;
            animation: scan 3s linear infinite;
        }


        @keyframes scale {
            0% { transform: scale(1) translate(-50%, -50%); }
            50% { transform: scale(1.2) translate(-40%, -40%); }
            100% { transform: scale(1) translate(-50%, -50%); }
        }

        @keyframes scan {
            0% { top: 0; box-shadow: 0 -7px 13px #C20C0D;}
            50% { top: 99%; box-shadow: 0 0 13px #C20C0D;}
            100% { top: 0; box-shadow: 0 7px 13px #C20C0D;}
        }

    </style>
</head>

<body>
    <div class="input">
        <header>
            <img src="img/logo.svg" />
        </header>
        <h1>Koffiedikkijker</h1>
        <h2>De toekomst staat in je koffie</h2>
        <ol>
            <li>Drink je koffie</li>
            <li>Maak een foto van jou residu</li>
            <li>Zie je toekomst en verdien prijzen</li>
        </ol>
        <div id="clockdiv"></div>
        <div class="custom-file-upload">
            <input type="file" capture="camera" accept="image/*" id="takePictureField" name="myfiles[]" multiple />
        </div>
    </div>

    <div class="loader" style="display: none;"><h2>Scanning...</h2></div>
    <span class="scan-line" style="display: none;"></span>
    <img id="yourimage">


    <script>
    var deadline = 'January 15 2016 16:59:59 GMT+02:00';
	var desiredWidth;
    $(document).ready(function() {
        console.log('onReady');
		$("#takePictureField").on("change",gotPic);
		desiredWidth = window.innerWidth;

        if(!("url" in window) && ("webkitURL" in window)) {
            window.URL = window.webkitURL;
        }

	});

	function gotPic(event) {
        if(event.target.files.length == 1 &&
           event.target.files[0].type.indexOf("image/") == 0) {
            var imageUrl = URL.createObjectURL(event.target.files[0]);
            $("#yourimage").attr("src", imageUrl);
            $(".input").hide();
            $(".loader").show();
            $(".scan-line").show();
            setTimeout(function () { loadResultPage(imageUrl) }, 6000);
        }
	}

        function loadResultPage(imageUrl) {
            location.href = "/Result.aspx?image=" + imageUrl;
        };

        function initializeClock(id, endtime) {
            var clock = document.getElementById(id);
            var timeinterval = setInterval(function () {
                var t = getTimeRemaining(endtime);
                clock.innerHTML = 'Scan je koffie binnen: ' + t.hours + ' uur, ' + t.minutes + ' minuten en ' + t.seconds + ' seconden voor dubbele punten!';
                if (t.total <= 0) {
                    clearInterval(timeinterval);
                }
            }, 1000);
        };

        function getTimeRemaining(endtime) {
            var t = Date.parse(endtime) - Date.parse(new Date());
            var seconds = Math.floor((t / 1000) % 60);
            var minutes = Math.floor((t / 1000 / 60) % 60);
            var hours = Math.floor((t / (1000 * 60 * 60)) % 24);
            var days = Math.floor(t / (1000 * 60 * 60 * 24));
            return {
                'total': t,
                'days': days,
                'hours': hours,
                'minutes': minutes,
                'seconds': seconds
            };
        }

        initializeClock('clockdiv', deadline);

        (function ($) {

            var multipleSupport = typeof $('<input/>')[0].multiple !== 'undefined',
                isIE = /msie/i.test(navigator.userAgent);

            $.fn.customFile = function () {

                return this.each(function () {

                    var $file = $(this).addClass('custom-file-upload-hidden'),
                        $wrap = $('<div class="file-upload-wrapper">'),
                        $input = $('<input type="text" class="file-upload-input" />'),
                        $button = $('<button type="button" class="file-upload-button">Scan je koffie</button>');

                    $file.css({
                        position: 'absolute',
                        left: '-9999px'
                    });

                    $wrap.insertAfter($file)
                      .append($file, $input, (isIE ? $label : $button));

                    // Prevent focus
                    $file.attr('tabIndex', -1);
                    $button.attr('tabIndex', -1);

                    $button.click(function () {
                        $file.focus().click(); 
                    });

                    $file.change(function () {

                        var files = [], fileArr, filename;

                        if (multipleSupport) {
                            fileArr = $file[0].files;
                            for (var i = 0, len = fileArr.length; i < len; i++) {
                                files.push(fileArr[i].name);
                            }
                            filename = files.join(', ');

                        } else {
                            filename = $file.val().split('\\').pop();
                        }

                        $input.val(filename) 
                          .attr('title', filename) 
                          .focus(); 

                    });

                    $input.on({
                        blur: function () { $file.trigger('blur'); },
                        keydown: function (e) {
                            if (e.which === 13) { // Enter
                                if (!isIE) { $file.trigger('click'); }
                            } else if (e.which === 8 || e.which === 46) { 
                                $file.replaceWith($file = $file.clone(true));
                                $file.trigger('change');
                                $input.val('');
                            } else if (e.which === 9) { // TAB
                                return;
                            } else { // All other keys
                                return false;
                            }
                        }
                    });

                });

            };

        }(jQuery));

        $('input[type=file]').customFile();
    </script>
</body>
</html>