<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Result.aspx.cs" Inherits="KoffiedikKijker.Web.Result" Async="true" %>

<!DOCTYPE html>

<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <title>DE Koffiedikkijker - Uw persoonlijke horoscoop</title>

    <script type="text/javascript" charset="utf-8" src="scripts/jquery-2.2.0.min.js"></script>
</head>
<body>
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

        .image-wrapper {
            display: flex;
            justify-content: space-around;
            align-items: center;
        }

        #image {
            width: 30%;
            margin: 2rem;
        }

        .scan-text {
            font-size: 2.5rem;
        }

        .content {
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 3.5rem;
            margin: 2rem;
        }

        .meter-container {
            position: absolute;
            left: 50%;
            transform: translateX(-50%);
        }

        .meter {
            width: 90vw; 
            background: #eee;
            height: 2rem;
            position: relative;
            left: 50%;
            bottom: 1rem;
            transform: translateX(-50%);
        }

        .minimum, .maximum {
            position: absolute;
            bottom: 1.2rem;
            left: 6vw;
            z-index: 1;
            font-size: 1.5rem;
        }

        .maximum {
            left: auto;
            right: 6vw;
        }

        .meter .full {
            background: #C20C0D;
            width: 69%;
            height: 100%;
            display: block;
        }

        .more-info {
            background: aqua;
            border-radius: 50%;
            display: block;
            width: 28px;
            height: 5%;
            position: absolute;
            bottom: 5%;
            right: 2%;
        }

        @media (max-width: 1200px) {
            .more-info {
                bottom: 13%;
                right: 5vw;
            }
        }

        .more-info span {
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            position: absolute;
        }

    </style>
    <header>
        <img src="img/logo.svg" />
    </header>
    
    <div class="image-wrapper">
        <asp:Image id="image" runat="server" />

        <p class="scan-text">
            <asp:Literal ID="output" runat="server" />
        </p>
    </div>
    
    <asp:PlaceHolder ID="containerContent" runat="server">
    <div class="content">
        <p>"Balen! het is vandaag je laatste werkdag, zeg je iedereen even gedag?"</p>
        <p>"Het gaat bergopwaarts met jou, vanaf morgen gaat je verbeterde contract in!"</p>
        <p>"het einde van een sprint komt pas echt in zicht wanneer je ermee begint, zorg dat je volgende week wel begint."</p>
        <p>"Neem een kop koffie, het kan vandaag zomaar je laatste zijn."</p>
        <p>"innoveren is net zo moeilijk als creeren, durf vandaag anders te zijn."</p>
        <p>"De afgelopen twee dagen hebben veel van je creativiteit geëist, dit zal effect hebben op je weekend. Doe daarom even rustig aan."</p>
        <p>"Deze week heb je geen goede indruk op je collega's achtergelaten, maak je het vanmiddag goed in de bar?"</p>
        <p>"Deze week stond voor jou in het teken van goede beslissingen. Let op dat je niet te enthousiast wordt. Wees waakzaam."</p>
        <p>"Net als het weer was je deze week een beetje somber. Dit weekend gaat de zon schijnen, ook voor jou! Leuke dingen staan te gebeuren."</p>
        <p>"De afgelopen periode heb je veel uitgaven gehad. Let de weekend op je portemonnee, een financiële tegenvaller ligt op de loer."</p>
        <p>"Pas op als je de weg oversteekt, een ongelukje kan zowel van links als van rechts komen."</p>
        <p>"Vandaag zal je een goede keuze maken. Maar let op, dat zijn ze niet allemaal!"</p>
        <p>"Doe vandaag niet te overhaast, drink een kop koffie en pak je rust. Je kan toch niet sneller werken dan de wereld om je heen."</p>
        <p>"Pieter van den Hoogenband drinkt altijd een kop koffie voordat hij aan zijn finale slag begint, ook jij moet je vasthouden aan de rituelen die je succes geven."</p>
    </div>
    <div class="meter-container">
        <span class="minimum">
            67
        </span>
        <div class="meter">
            <span class="full"></span>
        </div>
        <%--<a class="more-info" href=""><span>?</span></a>--%>
        <span class=" maximum">
            90
        </span>
    </div>
     </asp:PlaceHolder>
  
    <script>
        function getParameterByName(name) {
            name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
            var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
                results = regex.exec(location.search);
            return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
        }

        $(document).ready(function () {
            var random = Math.floor(Math.random() * $('.content p').length);
            var querystring = getParameterByName('index');
            if (querystring) random = querystring;
            $('.content p').hide().eq(random).show();
        });
    </script>
</body>
</html>