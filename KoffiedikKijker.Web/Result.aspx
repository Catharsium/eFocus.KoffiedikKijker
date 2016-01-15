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
            margin-bottom: 2rem;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
        }

        .meter {
            width: 90vw; 
            background: #eee;
            height: 2rem;
            position: relative;
            left: 50%;
            transform: translateX(-50%);
        }

        .minimum, .maximum {
            position: absolute;
            bottom: 0.2rem;
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
        <p>
            “Even bad coffee is better than no coffee at all.”
            <strong>― David Lynch</strong>
        </p>
        <p>
            "Balen! het is vandaag je laatste werkdag, zeg je iedereen even gedag?"
        </p>
        <p>
            "Het gaat bergopwaarts met jou, vanaf morgen gaat je vernieuwde contract in!"
        </p>
        <p>
            "Aerosmith-frontman Steven Tyler biechtte op dat hij tijdens zijn jaren als junkie gigantische bergen drugs heeft genuttigd. Hij was eraan gewend en z'n bandmaatjes deden het ook, dus Steven vond het allemaal best, maar achteraf gezien is het vrij bizar. Denk eens terug aan wat je vijf jaar geleden aan het doen was en vraag je deze week af of je echt van je fouten hebt geleerd."
        </p>
        <p>
            "Een rijke Schotse edelman kreeg van een vriend een zak wiet cadeau. De kwaliteit was echter onder de maat, dus belde hij de politie om te klagen. Die schreef meteen een boete uit voor drugsbezit. Kijk deze week uit bij wie je precies aan de bel trekt, als je niet nog verder in de problemen wil komen."
        </p>
        <p>
            "Mensen die voor een Oscar genomineerd waren, maakten natuurlijk kans op het meest felbegeerde beeldje in de filmwereld. Maar of ze de award nou mee naar huis nemen of niet, iedere kanshebber ontvangt sowieso een propvolle goodie bag die veel meer geld waard is dan de hoofdprijs. Een troostprijs hoeft niet altijd een afgang hoeft te zijn. Wees blij met wat je krijgt."
        </p>
        <p>
            "het einde van een sprint komt pas in zicht wanneer je begint"
        </p>
        <p>
            "innoveren is net zo moeilijk als creeren, durf anders te zijn"
        </p>
        <p>
            "doe je gordijn open om te zien wat voor weer het is"
        </p>
        <p>
            "Je bent zo helder als koffiedik kijken."
        </p>
        <p>
            "Neem een kop koffie, het kan zomaar je laatste zijn"
        </p>
        <p>
            "Wanneer je baas je koffie aanbiedt, zeg dan ja. Je weet nooit welke bijbedoelingen hij heeft"
        </p>
        <p>
            Drink koffie niet alleen voor de cafeïne
            Ja, er zit cafeïne in het zwarte goud, maar dat zit evengoed in frisdrank of energiedrankjes. Koffie drink je niet alleen voor een oppepper, maar ook om te genieten van het brede smaakpalet, waarin het kleinste verschil veroorzaakt is door een andere samenstelling, kweekhoogte of bodem.
        </p>
        <p>
            Warm je koffie niet op
            Na ongeveer twintig minuten wordt koffie zurig. Daarom moet je een kopje koffie niet te lang laten staan en al helemaal niet opwarmen. Opgewarmde koffie is simpelweg niet lekker en bovendien is de koffieprijs dusdanig dat het niet nodig is om koffie op te warmen. Het kan wel handig zijn om de hoeveelheid koffie die je zet te beperken tot dat wat je nodig hebt. Dan heb je ook niet de mogelijkheid om de koffie op te warmen.
        </p>
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