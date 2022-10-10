<!DOCTYPE html>
<html>

    <head prefix="og: http://ogp.me/ns#">
        <meta charset="utf-8">
        <meta name="generator" content="https://mypdns.org/spirillen">
        <title>My Privacy DNS's blocking rules for Ad-blockers</title>
        <link rel="preload" href="style.css">
        <link rel="preload"
            href="/assets/application_utilities_dark-9aab2a3cee6460c807a07e08fd90f1b437bd024468f30154c162755f26705d70.css"
            as="style" type="text/css">
        <link rel="preload"
            href="/assets/application_dark-fb47def5c7bac4103062f03d10bd5448526f50d9b4d162f950808fe25e6a6496.css"
            as="style" type="text/css">
        <link rel="preload"
            href="/assets/highlight/themes/dark-0537c09f077245d346ebbe73ea39b18833487d026751b5d0dd67c2ee82bdf3f9.css"
            as="style" type="text/css">
        <link rel="stylesheet" href="style.css">
        <link rel="license" href="https://mypdns.org/my-privacy-dns/adblocker-rules-/blob/master/LICENSE">
        <link rel="prefetch" href="https://mypdns.org/">
        <link rel="shortcut icon" type="image/png" href="/uploads/-/system/appearance/favicon/1/Icon___Wordmark.png"
            id="favicon" data-original-href="/uploads/-/system/appearance/favicon/1/Icon___Wordmark.png" />

    </head>

    <body
        class="gl-dark tab-width-4 gl-browser-firefox gl-platform-windows diff-custom-addition-color diff-custom-deletion-color">
        <div class="navbar">

            <a href="https://mypdns.org/my-privacy-dns/adblocker-rules" target="_top">Repository</a>
            <a href="https://mypdns.org" target="_blank">My Privacy DNS</a>
        </div>

        <h1>My Privacy DNS's – Adblock Rules</h1>

        <p>
            Project aim's to provide a number of rules to your adblocker like
            uBlock Origin, Adguard or any other that support the format in
            complementary to <a href="https://easylist.to/" title="EasyList">easylist</a>
        </p>

        <p>
            We support the uBlock Origin rule-sets when writing rules.
            In case of twists, the uBlockOrigin ruleset wins for fixing a issue.
        </p>

        <p>
            <?php
                // Program to display current page URL.
                $link = (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] 
                            === 'on' ? "https" : "http") . 
                            "://" . $_SERVER['HTTP_HOST'] . 
                            $_SERVER['REQUEST_URI'];
                echo $link;
            ?>

            Click here to <a
            href="abp:subscribe?location=https://mypdns.org/adblocker-rules/blockrules.txt&title=My%20Privacy%20DNS%20–%20Adblock%20Rules"
            target="_top" title="Subscibe this list to adblocker">activate</a>
            in uBlock Origin or You can find the builded list
            <a href="./blockrules.txt">here</a>
            
        </p>

        <p>
            If you would like to contribute to the list, please do it at this <a
                href="https://mypdns.org/my-privacy-dns/adblocker-rules">repo</a></p>
        <p>Cheers</p>

    </body>

</html>