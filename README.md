[![uBlock syntax](https://img.shields.io/badge/syntax-uBlock%20Origin-%23c61300.svg)](https://github.com/gorhill/uBlock/wiki/Static-filter-syntax)
[![AdGuard syntax](https://img.shields.io/badge/syntax-AdGuard-%23c61300.svg)](https://kb.adguard.com/en/general/how-to-create-your-own-ad-filters)

# Contents
I can't guarantee these filers won't cause problems. If you found
problems, [report][issues] it by filling in all the mandatory items in Issue
template; otherwise reports can be ignored. Anyone who uses any of my
filters/codes shall be deemed to have agreed that I have no responsibility
or liability for costs, losses, damages, etc. arising from the use of
the filters/codes. Unless Subscribe link is provided these filters are
assumed to be copied and pasted, or imported, into My filters/rules
(uBlock Origin) or User Rules (AdGuard).


## Issues and comments
The one and only place to report any issues or post a comment are as
following:
- [Issues][issues] with any rules is reported on the My Privacy DNS Site.
- Commit Comments are posted on the individual [commit][commits]'s on
  the My Privacy DNS Site, in case you don't think it need a
  [Issues][issues].
- Common questions, non specific filter topics, goes straight to the
  [Support][support] board on  the My Privacy DNS Site.
- Any comments or issues posted elsewhere will in the future be ignored
  in full. ***The grace period is excised***.

`github.com` is in *only* a full backup of
https://mypdns.org/my-external-stuff/ublockorigin-rules and solely used
to host the [webfront](#webfront).  
We do not operate at Github do to there anti-privacy terms of usage.

# How to write filters

## File structure

| File naming | Filters supported                                                                                                                                                      |
| :---------- | :--------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `_domain.`  | These filter lists is to ad rules based on a domain specific level. ***IF / when*** a rules is covering more than one domain, you should add it to the `_rule` filters |
| `_rule`     | The place for rules covering more than one domain.                                                                                                                     |


### Sorting filters
We are sorting the rules based on the second level domain in the `_domain.`
filters. In the `_rule` we sort based on the letter/number `[a-zA-Z0-9]`
disregarding the actual filter first are present at the 3rd argument.


#### Example
In this rules we like to hide the `.modal-backdrop` but to actually succeed
with this, will need some more arguments.

```css
##.show.fade.modal-backdrop
```

This should be sorted by the first `s`

## Filter Inclusion - Exclusions
We will only in sevier cases include any rules that could/can be blocked
by a DNS related firewall like DNS RPZ.

**IF** a rules is included, this will be to support the tor-browser where
any local firewall rule is bypassed.


## Filter writing guides
Howto? [block whitelisted spyware](https://github.com/easylist/easylist/issues/4529)

`$` always needs to exist, if you're going to use a modifier.  
`,` are used to separate multiple modifier.

Example (single modifier): `$script`  
Example (multiple modifiers): `$document,frame,script,stylesheet`


## Counter other's rules
You can't use `badfilter` modifiers for cosmetic rules.

For example, `#@#.ads` can't be disabled with `#@#.ads$badfilter`

Instead, you need to re-activate the CSS rule with a new blocking
rule, which goes under the whitelisting radar (so-to-speak).

To override `#@#.ads`, something like `##[class="ads"]`, `##[class^="ads"]`
or `##[class*="ads"]` is needed. The (`^` = begins with / `*` = contains)
will work, since `#@#.ads` only disables/whitelists `##.ads.`

* `$badfilter`: Deactivates a resource-blocking entry, even if it is
  present in another list.
* `$important`: Makes a resource-blocking entry take precedence over
  another whitelisting entry.
* `$redirect`: Redirects resources to a neutered version that has been 
  embedded in those extensions. Possible options are listed in
  [this file][redirect-engine]
  (AdGuard has a [slightly smaller selection][slightly_smaller_selection]).
* `$empty`: Results in a fake empty page being loaded, instead of an 
  error page.


## Source URI's
How to write filters: <https://help.eyeo.com/en/adblockplus/how-to-write-filters>


### badfilter example
If the original rule was like

```css
@@/advertise.js$script,domain=example.com|xyz.com
```

Then

```css
@@/advertise.js$script,domain=example.com,badfilter
```

is a valid filter, it disables the whitelisted rule only on `example.com`.

See the dialogue at [github][dialogue]


## Webfront
Our HTML front end is <https://my-external-stuff.github.io/ublockorigin-rules/>


## Subscribe to the rules
[Click here to activate these rules in you uBlock Origin][Subscribe]


## External resources
@Yuki2718 [/adblock](https://github.com/Yuki2718/adblock)

@yourduskquibbles [/webannoyances](https://github.com/yourduskquibbles/webannoyances)

@ryanbr [fanboy-adblock](https://github.com/ryanbr/fanboy-adblock)

@pgl [yoyo.org](https://pgl.yoyo.org/)

@EasyList [easylist.to](https://easylist.to)

And everyone else I've forgot to mention here.  
Have a look in the [source list](/ublockorigin-rules.template)


## Tanks
Thanks to @Yuki2718, @THEtomaso, @krystian3w and everyone else who is
spreading the knowledge of how rules should be made :smiley:

[issues]: https://mypdns.org/my-external-stuff/ublockorigin-rules/-/issues
[commits]: https://mypdns.org/my-external-stuff/ublockorigin-rules/commits/master
[support]: https://mypdns.org/MypDNS/support/-/issues
[Subscribe]: abp:subscribe?location=https://my-external-stuff.github.io/ublockorigin-rules/blockrules.txt&title=Spirillens%20%E2%80%93%20Adblock%20Rules
[redirect-engine]: https://github.com/gorhill/uBlock/blob/master/src/js/redirect-engine.js
[dialogue]: https://github.com/My-External-Stuff/ublockorigin-rules/commit/c01ba1a5a0d73a89c911ab11d1322631fe3d0540
[slightly_smaller_selection]: https://github.com/AdguardTeam/AdguardBrowserExtension/blob/master/Extension/lib/filter/rules/scriptlets/redirects.yml
