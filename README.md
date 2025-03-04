[![uBlock syntax](_public/icons/ublock-origin-syntax.svg)](https://github.com/gorhill/uBlock/wiki/Static-filter-syntax)
[![AdGuard syntax](_public/icons/adguard-syntax.svg)](https://kb.adguard.com/en/general/how-to-create-your-own-ad-filters)
[![ko-fi](_public/icons/ko-fi.png)](https://ko-fi.com/X8X37FUGU)
[![Donate](_public/icons/donate.png)](https://github.com/mypdns/matrix/blob/master/DONATION.md)
[![My Privacy DNS](_public/icons/logo-h128.png)](https://github.com/mypdns/matrix "This project is part of My Privacy DNS")

# Adblocker Rules

These adblock filters you will find inside this repository
will in some degree be a supportive to the more common know filters like
[EasyList][EasyList] or [AdGuard][AdGuard].

## About

Some important notes is this project started as a private project,
however as the time how parsed by, it looks like other users are using
one or more of our rules and filter, just as we are including 3rd party
filters.

This means the precision in the filtering rules might not be as sharp as
they could have been if this have been a major part of my portfolio,but
this is purely a side project.

## Disclaimer

I can't guarantee these filers won't cause problems. If you found
problems, [report][issues] it by filling in all the mandatory items in
Issue template; otherwise reports can be ignored. Anyone who uses any of
my filters/codes shall be deemed to have agreed that I have no
responsibility or liability for costs, losses, damages, etc. arising
from the use of the filters/codes. Unless Subscribe link is provided
these filters are assumed to be copied and pasted, or imported, into My
filters/rules (Adblock Plus / uBlock Origin) or User Rules (AdGuard).

## Webfront

Our HTML front end can be found at

- 0xacab: <https://mypdns.github.io/adblocker-rules/>
- GitHub: No longer Supported as they have incorporated SpyWare

## Subscribe to the rules

[Click here to activate these rules in your Adblocker][Subscribe]

The following Lnks will provide you with different resulting filters.
0xacab Editions should be the most advanced and compressed thanks to
the @adguard/hostlist-compiler compiler, where the GH editions relay on
the abp filter script.

- 0xacab edition via [adblocker.mypdns.org][Subscribe]
- Github No longer Supported

You should also be able to subscribe directly to the rules by
right-click any of the following urls, choose `<Adblocker>` =>

  ```html

<Subscribe to the filterlist>`

  <a href="abp:
  subscribe?location=https://mypdns.github.io/adblocker-rules/blockrules.txt&title=My%20Privacy%20DNS%20%E2%80%93%20Adblock%20Rules&requiresLocation=https://mypdns.github.io/adblocker-rules/blockrules.txt&requiresTitle=My%20Privacy%20DNS%20%E2%80%93%20Adblock%20Rules%20%E2%80%93%20github%20Edition"
  title="Subscribe to My Privacy DNS adblocker rules (0xacab
  edition)">adblocker.mypdns.org | Adblock Rules (github edition)
  </a>
  ```

## Issues and comments

The one and only place to report any issues or post a comment are as
following:

- [Issues][issues] with any rules is reported on the My Privacy DNS Site.
- Commit Comments are posted on the individual [commit][commits]'s on
  the My Privacy DNS Site, in case you don't think it need a
  [Issues][issues].
- Common questions, non specific filter topics, goes straight to the
  [Support][support] board on the My Privacy DNS Site.
- Any comments or issues posted elsewhere will in the future be ignored
  in full. ***The grace period is excised***.

`github.com` is in *only* a full backup of
We do no longer operate at `Github` do to there anti-privacy terms of usage.

# Writing filters

## File structure

| File naming                  | Supported filter types                                                                                                                                                                                                                                          |
|:-----------------------------|:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `_domain.`                   | These filter lists is to ad rules based on a domain specific level. ***IF / WHEN*** a rules is covering more than one domain, you should add it to the corresponding `_rule` filters                                                                            |
| `_rule`                      | The place for rules covering more than one domain.                                                                                                                                                                                                              |
| `adult_*.blacklist`          | This is as the filename indicating the place to add NSFW ONLY contents *AND* only if it do not match any other filter(s)                                                                                                                                        |
| `adware_*.blacklist`         | Let take a guess, any promotional contents this is external as internal ads                                                                                                                                                                                     |
| `annoyance_*.blacklist`      | Any kind of rules which did not fit into any other filter(s) and which does not as such brakes the functionality of the site.                                                                                                                                   |
| `anti_social_*.blacklist`    | filters that can help preventing building any kind of tracking links to any spyware domain like google, yandex, facebook, TikTok, Reddit, Telegram or similar (anti-)"social" and anti-democracy places.                                                        |
| `anti_whitelist_*.blacklist` | Found a rules elsewhere your would like to encounter, this is the filters for it.                                                                                                                                                                               |
| `cookie_*.blacklist`         | Everything preventing cookies being set, where not needed or used for any sorts of tracking/spying/logging :cookie: (1st & 3rd party)                                                                                                                           |
| `noise.txt`                  | :warning: **_WARNING_**! The following filter, WILL bring interruption to sites functionality. These rules are to clean up sites by removing all the unnecessary noise, bit like @yourduskquibbles webannoyances, but breaking things doesn't matter **AT ALL** |
| `spyware_*.blacklist`        | Filter preventing any kind of tracking, spying and alike. If you have to ask, you need to read [SpyWare Wiki](https://0xacab.org/my-privacy-dns/matrix/-/wikis/Categories/Spyware/SpyWare)                                                                      |
| `whitelist_*.whitelist`      | Probably not very used... But it can come in handy sometimes protecting something to keep is spinning....                                                                                                                                                       |

### Sorting filters

We are sorting the rules based on the second level domain in the `_domain.`
filters. In the `_rule` we sort based on the letter/number `[a-zA-Z0-9]`
disregarding the actual filter first are present at the 3rd argument.

#### Example

In this rules we like to hide the `.modal-backdrop` but to actually succeed
with this, will need some more arguments.

```
##.show.fade.modal-backdrop
```

This should be sorted by the first `s`

## Filter Inclusion - Exclusions

We will only in sevier cases include any rules that could/can be blocked
by a DNS related firewall like DNS RPZ.

**IF** a rules is included, this will be to support the tor-browser where
any local firewall rule is bypassed.

## Writing filter guides

Howto? block whitelisted spyware: (~~`https://github.com/easylist/easylist/issues/4529`~~
SpyWare infected domain)

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

```
@@/advertise.js$ script,domain=example.com|xyz.com
```

Then

```
@@/advertise.js$script,domain=example.com,badfilter
```

is a valid filter, it disables the whitelisted rule only on `example.com`.

See the dialogue at [github][dialogue]

## External resources

Please see `tools/hostscompilerconf.json5` & `tools/noise.json`

## Sponsors

- Jetbrains, Provided free licence to any members, who have been working more than 3 month for My Privacy DNS open
  source project https://www.jetbrains.com/community/opensource/.

## Build tools

we uses the HostlistCompiler https://github.com/AdguardTeam/HostlistCompiler to build our lists

## Official mirrors

The following repositories are official mirrors and should (when things
goes right) be updated by [push on commit][poc]

| Project         | Host                                                       | Metode (push \| pull) |
|:----------------|:-----------------------------------------------------------|----------------------:|
| Adblocker Rules | `https://git.disroot.org/my-privacy-dns/adblocker-rules`   |                  push |
| Adblocker Rules | `https://git.kescher.at/my-privacy-dns/adblocker-rules`    |                  pull |
| Adblocker Rules | `https://gitea.slowb.ro/spirillen/adblocker-rules`         |                  pull |
| Adblocker Rules | `https://github.com/mypdns/adblocker-rules`                |                  push |
| Adblocker Rules | `https://gitlab.com/my-privacy-dns/matrix/adblocker-rules` |                  push |
| Adblocker Rules | `https://notabug.org/my-privacy-dns/adblocker-rules`       |                  pull |
| ============    | =====================================================      |      ================ |
| Matrix          | `https://git.disroot.org/my-privacy-dns/matrix`            |                  push |
| Matrix          | `https://gitea.slowb.ro/spirillen/matrix`                  |                  push |
| Matrix          | `https://github.com/mypdns/matrix`                         |                  push |
| Matrix          | `https://gitlab.com/my-privacy-dns/matrix/matrix`          |                  push |
| Matrix          | `https://notabug.org/my-privacy-dns/matrix`                |                  pull |

## Tanks to

Thanks to @Yuki2718, @THEtomaso, @krystian3w and everyone else who is
spreading the knowledge of how rules should be made :smiley:

<!-- Own Links -->

[issues]: https://github.com/mypdns/adblocker-rules/issues

[commits]: https://github.com/mypdns/adblocker-rules

[support]: https://0xacab.org/my-privacy-dns/support

[Subscribe]: abp:subscribe?location=https://mypdns.github.io/adblocker-rules/blockrules.txt&title=My%20Privacy%20DNS%20%E2%80%93%200xacab%20Edition%20%E2%80%93%20Adblock%20Rules

<!-- External Links -->

[redirect-engine]: https://github.com/gorhill/uBlock/blob/master/src/js/redirect-engine.js

[dialogue]: https://github.com/My-External-Stuff/ublockorigin-rules/commit/c01ba1a5a0d73a89c911ab11d1322631fe3d0540

[slightly_smaller_selection]: https://github.com/AdguardTeam/AdguardBrowserExtension/blob/master/Extension/lib/filter/rules/scriptlets/redirects.yml

[EasyList]: https://github.com/easylist/easylist

[easylist.to]: https://easylist.to

[AdGuard]: https://adguard.com/

[poc]: https://0xacab.org/help/user/project/repository/mirror/push.md "Push mirroring"
.
