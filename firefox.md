# disable https redirect

The solution that worked for me:

    Go to about:config
    Look for network.stricttransportsecurity.preloadlist and set it to false
    Enjoy

If the above STILL DOES NOT WORK, try setting browser.fixup.fallback-to-https to false from about:config

