# contents

How to write filters
--------------------
Howto? [block whitlisted spyware](https://github.com/easylist/easylist/issues/4529)

@DandelionSprout have written this: [](https://github.com/DandelionSprout/adfilt/blob/master/Wiki/SyntaxMeaningsThatAreActuallyHumanReadable.md#blocking)
but a few examples would be greate

`$` always needs to exist, if you're going to use a modifier.
`,` are used to separate multiple ones.

Example (single modifier): `$script`
Example (multiple modifiers): `$document,frame,script,stylesheet`

Also, you can't use such modifiers for cosmetic rules.
For example, `#@#.ads` can't be disabled with `#@#.ads$badfilter`
Instead, you need to re-activate the disabled rule with a new blocking
rule, which goes under the whitelistings radar (so-to-speak).
To override `#@#.ads`, something like `##[class="ads"]`, `##[class^="ads"]`
or `##[class*="ads"]` (`^` = begins with / `*` = contains) will work, since `#@#.ads` only disables/whitelists `##.ads.`

* `$badfilter`: Deactivates a resource-blocking entry, even if it is present in another list.
* `$important`: Makes a resource-blocking entry take precedence over another whitelisting entry.
* `$redirect`: Redirects resources to a neutered version that has been embedded in those extensions. Possible options are listed in

[this file](https://github.com/gorhill/uBlock/blob/master/src/js/redirect-engine.js)
(AdGuard has a [slightly smaller selection](https://github.com/AdguardTeam/AdguardBrowserExtension/blob/master/Extension/lib/filter/rules/scriptlets/redirects.yml)).
* `$empty`: Results in a fake empty page being loaded, instead of an error page.


## Source URI's
How to write filters: <https://help.eyeo.com/en/adblockplus/how-to-write-filters>

[Click here to activate in uBlock Origin](abp:subscribe?location=https://my-external-stuff.github.io/ublockorigin-rules/blockrules.txt&title=Spirillens%20%E2%80%93%20Adblock%20Rules)


## Webfront
Our HTML front end is <https://my-external-stuff.github.io/ublockorigin-rules/>

### badfilter example
If the original rule was like

```
@@/advertise.js$script,domain=abc.com|xyz.com
```

Then

```
@@/advertise.js$script,domain=abc.com,badfilter
```

is a valid filter, it disables the allowlist only on abc.com.

See the dialog at <https://github.com/My-External-Stuff/ublockorigin-rules/commit/c01ba1a5a0d73a89c911ab11d1322631fe3d0540>

## External Sources
@Yuki2718 [/adblock](https://github.com/Yuki2718/adblock)

@yourduskquibbles [/webannoyances](https://github.com/yourduskquibbles/webannoyances)

@ryanbr [fanboy-adblock](https://github.com/ryanbr/fanboy-adblock)

@pgl [yoyo.org](https://pgl.yoyo.org/)

@EasyList [easylist.to](https://easylist.to)

And everyone else I've forgotten to mention here.
Have a look in the [source list](/ublockorigin-rules.template)

## Tanks
Thanks to @Yuki2718, @THEtomaso, @krystian3w and everyone else who is spreading
the knowledge of how rules should be made :smiley:
