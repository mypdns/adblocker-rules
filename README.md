# contents

.. contents::

How to write filters
--------------------
[Howto? block whitlisted spyware](https://github.com/easylist/easylist/issues/4529)

@DandelionSprout have written this: [](https://github.com/DandelionSprout/adfilt/blob/master/Wiki/SyntaxMeaningsThatAreActuallyHumanReadable.md#blocking) but a few axamples would be greate


* `$badfilter`: Deactivates a resource-blocking entry, even if it is present in another list.
* `$important`: Makes a resource-blocking entry take precedence over another whitelisting entry.
* `$redirect`: Redirects resources to a neutered version that has been embedded in those extensions. Possible options are listed in 
    [this file](https://github.com/gorhill/uBlock/blob/master/src/js/redirect-engine.js)
    (AdGuard has a [slightly smaller selection](https://github.com/AdguardTeam/AdguardBrowserExtension/blob/master/Extension/lib/filter/rules/scriptlets/redirects.yml)).
* `$empty`: Results in a fake empty page being loaded, instead of an error page.


## Source URI's
How to write filters: <https://help.eyeo.com/en/adblockplus/how-to-write-filters>

[Click here to activate in adBlockPlus](https://subscribe.adblockplus.org/?location=https://spirillen.github.io/ublockorigin-rules/blockrules.txt&title=My%20Privacy%20DNS)

## Webfront
Our HTML front end is <https://spirillen.github.io/ublockorigin-rules/>
