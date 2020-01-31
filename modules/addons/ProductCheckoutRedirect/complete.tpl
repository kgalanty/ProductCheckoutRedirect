<link rel="stylesheet" type="text/css" href="templates/orderforms/{$carttpl}/style.css" />

<div id="order-modern">

    <div class="container">
        <div class="card">
            <div class="card-body">
                <div class="card-tab-nav">
                    <div class="tab-item is-disabled">
                        <span> <span>1: </span> {$productname}</span>
                    </div>
                    <div class="tab-item" id="step1tabitem">
                        <span> <span>2. </span> Choose Domain</span>
                    </div>
                    <div class="tab-item is-active">
                        <span> <span>3. </span> Review & Complete</span>
                    </div>
                </div>
                <div class="card-tab-content">
                    <div class="card-content card--padded">
                        <div class="header-bordered">
                            <h1 class="card-title bordered text-center">{$LANG.orderconfirmation}</h1>
                        </div>
                        <div class="signupfields padded" style="
                             text-align: center;
                             line-height: 35px;
                             font-size: 16px; border:0
                             ">

                            <p>{$LANG.orderreceived}</p>

                            <div class="cartbox">
                                <p align="center"><strong>{$LANG.ordernumberis} {$ordernumber}</strong></p>
                            </div>

                            <p>{$LANG.orderfinalinstructions}</p>


                            {if $invoiceid && !$ispaid}
                                <br />

                                <div class="errorbox" style="display:block;">{$LANG.ordercompletebutnotpaid}</div>

                                <button class="button primary active" type="button" id="btnInv" onclick="window.location = 'viewinvoice.php?id={$invoiceid}';">
                                    <span class="button-text">{$LANG.invoicenumber}{$invoiceid}</span>

                                </button>


                            {/if}

                            {foreach from=$addons_html item=addon_html}
                                <div style="margin:15px 0 15px 0;">{$addon_html}</div>
                            {/foreach}

                            {if $ispaid}

                                {literal}

                                    <!-- Start of ReTargeter Tag -->
                                    <script type="text/javascript">
                                        (function (c, d, e, g, a) {
                                            g = c.createElement(d);
                                            g.type = "text/java" + d;
                                            g.async = !0;
                                            g.src = e;
                                            a = c.getElementsByTagName(d)[0];
                                            a.parentNode.insertBefore(g, a)
                                        }(document, "script", "//tag.retargeter.com/rt/4691/rt.min.js?t=" + Math.floor(Date.now() / 86400000)));
                                    </script>
                                    <!-- End of ReTargeter Tag -->
                                    <script type="text/javascript">
                                        window.RTWORLD = window.RTWORLD || [];
                                        RTWORLD.push({"type": "segment", "id": [898019]}, {"type": "conversion", "id": [1866]});
                                    </script>

                                    <!-- Facebook Conversion Code for TMDHosting >
                                    <script>(function () {
                                            var _fbq = window._fbq || (window._fbq = []);
                                            if (!_fbq.loaded) {
                                                var fbds = document.createElement('script');
                                                fbds.async = true;
                                                fbds.src = '//connect.facebook.net/en_US/fbds.js';
                                                var s = document.getElementsByTagName('script')[0];
                                                s.parentNode.insertBefore(fbds, s);
                                                _fbq.loaded = true;
                                            }
                                        })();
                                        window._fbq = window._fbq || [];
                                        window._fbq.push(['track', '6035621224619', {'value': '0.00', 'currency': 'USD'}]);
                                    </script>
                                    <noscript><img height="1"
                                                width="1"
                                                alt=""
                                                style="display:none"
                                                src="https://www.facebook.com/tr?ev=6035621224619&amp;cd[value]=0.00&amp;cd[currency]=USD&amp;noscript=1"/>
                                    </noscript>
                                    <! END facebook conversion code -->
                                    <!-- Facebook Pixel Code -->
                                    <script>
                                        !function (f, b, e, v, n, t, s)
                                        {
                                            if (f.fbq)
                                                return;
                                            n = f.fbq = function () {
                                                n.callMethod ?
                                                        n.callMethod.apply(n, arguments) : n.queue.push(arguments)
                                            };
                                            if (!f._fbq)
                                                f._fbq = n;
                                            n.push = n;
                                            n.loaded = !0;
                                            n.version = '2.0';
                                            n.queue = [];
                                            t = b.createElement(e);
                                            t.async = !0;
                                            t.src = v;
                                            s = b.getElementsByTagName(e)[0];
                                            s.parentNode.insertBefore(t, s)
                                        }(window, document, 'script',
                                                'https://connect.facebook.net/en_US/fbevents.js');
                                        fbq('init', '750746165053598');
                                        fbq('track', 'PageView');
                                        fbq('track', 'Purchase');
                                    </script>
                                    <noscript><img height="1" width="1" style="display:none"
                                                   src="https://www.facebook.com/tr?id=750746165053598&ev=PageView&noscript=1"
                                                   /></noscript>
                                    <!-- End Facebook Pixel Code -->


                                {/literal}


                                <img src="https://shareasale.com/sale.cfm?amount={$main_order_amount}&tracking={$main_order_id}&transtype=sale&merchantID=52592"
                                     width="1"
                                     height="1"
                                     >
                                <noscript>
                                <div style="display:inline;">
                                    <img height="1"
                                         width="1"
                                         style="border-style:none;"
                                         alt=""
                                         src="https://www.googleadservices.com/pagead/conversion/1035279321/?label=PR5UCLWdiAEQ2bfU7QM&amp;guid=ON&amp;script=0"/>
                                </div>
                                </noscript>

                                {literal}
                                    <script>(function (w, d, t, r, u) {
                                            var f, n, i;
                                            w[u] = w[u] || [], f = function () {
                                                var o = {ti: "4015832"};
                                                o.q = w[u], w[u] = new UET(o), w[u].push("pageLoad")
                                            }, n = d.createElement(t), n.src = r, n.async = 1, n.onload = n.onreadystatechange = function () {
                                                var s = this.readyState;
                                                s && s !== "loaded" && s !== "complete" || (f(), n.onload = n.onreadystatechange = null)
                                            }, i = d.getElementsByTagName(t)[0], i.parentNode.insertBefore(n, i)
                                        })(window, document, "script", "//bat.bing.com/bat.js", "uetq");</script>

                                    <!-- Google Code for GoogleConv Conversion Page -->
                                    <script type="text/javascript">
                                        /* <![CDATA[ */
                                        var google_conversion_id = 1035279321;
                                        var google_conversion_language = "en_US";
                                        var google_conversion_format = "3";
                                        var google_conversion_color = "ffffff";
                                        var google_conversion_label = "PR5UCLWdiAEQ2bfU7QM";
                                        var google_conversion_value = 1.00;
                                        var google_conversion_currency = "USD";
                                        var google_remarketing_only = false;
                                        /* ]]> */
                                    </script>

                                    <script type="text/javascript" src="//www.googleadservices.com/pagead/conversion.js">
                                    </script>
                                    <noscript>
                                    <div style="display:inline;">
                                        <img height="1" width="1" style="border-style:none;" alt="" src="//www.googleadservices.com/pagead/conversion/1035279321/?value=1.00&amp;currency_code=USD&amp;label=PR5UCLWdiAEQ2bfU7QM&amp;guid=ON&amp;script=0"/>
                                    </div>
                                    </noscript>

                                    <script>
                                        (function (w, d, t, r, u) {
                                            var f, n, i;
                                            w[u] = w[u] || [], f = function () {
                                                var o =
                                                        {ti: "5667095"}
                                                ;
                                                o.q = w[u], w[u] = new UET(o), w[u].push("pageLoad")
                                            }, n = d.createElement(t), n.src = r, n.async = 1, n.onload = n.onreadystatechange = function ()
                                            {
                                                var s = this.readyState;
                                                s && s !== "loaded" && s !== "complete" || (f(), n.onload = n.onreadystatechange = null)
                                            }
                                            , i = d.getElementsByTagName(t)[0], i.parentNode.insertBefore(n, i)
                                        })(window, document, "script", "//bat.bing.com/bat.js", "uetq");
                                    </script>
                                    <noscript>
                                    <img src="//bat.bing.com/action/0?ti=5667095&Ver=2" height="0" width="0" style="display:none; visibility: hidden;" />
                                    </noscript>

                                    <script language="JavaScript" type="text/javascript">
                                        window.ysm_customData = new Object();
                                        window.ysm_customData.conversion = "transId=,currency=,amount=";
                                        var ysm_accountid = "1M3SF868T1KID8GCALL2LRLALIK";
                                        document.write("<SCR" + "IPT language='JavaScript' type='text/javascript' "
                                                + "SRC=//" + "srv3.wa.marketingsolutions.yahoo.com" + "/script/ScriptServlet" + "?aid=" + ysm_accountid
                                                + "></SCR" + "IPT>");
                                    </script>

                                    <!-- <script type="text/javascript">
                            
                            
                                        adroll_adv_id = "UH6NGFVANFCXLGRSASNAAN";
                                        adroll_pix_id = "DMAARIBDCVE3XA4BMJ3LRO";
                            
                                        (function () {
                                            var oldonload = window.onload;
                                            window.onload = function () {
                                                __adroll_loaded = true;
                                                var scr = document.createElement("script");
                                                var host = (("https:" == document.location.protocol) ? "https://s.adroll.com" : "http://a.adroll.com");
                                                scr.setAttribute('async', 'true');
                                                scr.type = "text/javascript";
                                                scr.src = host + "/j/roundtrip.js";
                                                ((document.getElementsByTagName('head') || [null])[0] ||
                                                document.getElementsByTagName('script')[0].parentNode).appendChild(scr);
                                                if (oldonload) {
                                                    oldonload()
                                                }
                                            };
                            
                                        }());
                                    </script> -->
                                    <script type="text/javascript">
                                        document.write(unescape("%3Cscript id=%27pap_x2s6df8d%27 src=%27" + (("https:" == document.location.protocol) ? "https://" : "http://") + "affiliate.tmdhosting.com/scripts/trackjs.js%27 type=%27text/javascript%27%3E%3C/script%3E"));
                                    </script>
                                    <script type="text/javascript">PostAffTracker.setAccountId('default1');
                                        var sale = PostAffTracker.createSale();
                                        sale.setTotalCost('{$main_order_amount}');
                                        sale.setOrderID('{$main_order_id}');
                                        PostAffTracker.register();
                                    </script>
                                    <script type="text/javascript">
                                        var _ubaq = _ubaq || [];
                                        _ubaq.push(['trackGoal', 'convert']);
                                        (function () {
                                            var ub_script = document.createElement('script');
                                            ub_script.type = 'text/javascript';
                                            ub_script.src =
                                                    ('https:' == document.location.protocol ? 'https://' : 'http://') +
                                                    'd3pkntwtp2ukl5.cloudfront.net/uba.js';
                                            var s = document.getElementsByTagName('script')[0];
                                            s.parentNode.insertBefore(ub_script, s);
                                        })();
                                    </script>
                                {/literal}    


                                <!-- Enter any HTML code which needs to be displayed once a user has completed the checkout of their order here - for example conversion tracking and affiliate tracking scripts -->
                            {/if}

                        </div> 

                    </div>
                </div>
            </div>
        </div>
    </div>
    <br /><p style="text-align:center"><button class="button primary active" type="button" id="btnClientArea">
            <span class="button-text">Click here to go to your Client Area</span>
            <span class="button-preloader preloader"></span>
        </button>
    </p>
    <p style="text-align:center;display:none" id="customRedirect"><button class="button primary active" type="button" id="btnClientArea2">
            <span class="button-text">Click here to proceed</span>
            <span class="button-preloader preloader"></span>
        </button>
    </p>
</div>
<script>
    $("#btnClientArea").on('click', function ()
    {
        $(this).find('.button-text').css('visibility', 'hidden');
        $(this).find('.preloader').css('visibility', 'visible');
        window.location = "clientarea.php";
    });

</script>