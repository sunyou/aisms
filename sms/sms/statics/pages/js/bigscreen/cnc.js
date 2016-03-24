var cncmap = {
    'union.click.jd.com': 'http://myfavlink.sinaapp.com/tongji/jd.php',
    'click.union.jd.com': 'http://myfavlink.sinaapp.com/tongji/jd.php',
    'u.ctrip.com': 'http://basic.sinaapp.com/xiecheng.php',
    'www.ctrip.com': 'http://basic.sinaapp.com/xiecheng.php',
    'www.jd.com': 'http://myfavlink.sinaapp.com/tongji/jd.php',
    'click.yhd.com': 'http://basic.sinaapp.com/tongji/yhd.php', 
    'www.yhd.com': 'http://basic.sinaapp.com/tongji/yhd.php', 
    'ai.taobao.com': 'http://basic.sinaapp.com/tongji/aitaobao.php',    
    'temai.taobao.com': 'http://basic.sinaapp.com/tongji/temai.php', 
    'ZWWIRYYA%2FDpPH01wK9AmARIwX9K%2BAjBDXvuqoU47FHjfsActn': 'http://basic.sinaapp.com/tongji/juhuasuan.php', 
    'zGU34CA7K%2BPkqB05': 'http://basic.sinaapp.com/tongji/juhuasuan.php', 
    'www.alitrip.com': 'http://basic.sinaapp.com/tongji/alitrip.php',   
    'www.ebay.com': 'http://basic.sinaapp.com/tongji/ebay.php', 
    'rover.ebay.com': 'http://basic.sinaapp.com/tongji/ebay.php', 
    'www.newegg.cn': 'http://basic.sinaapp.com/tongji/egg.php', 
    'travel.elong.com': 'http://basic.sinaapp.com/tongji/elong.php', 
    'www.tootoo.cn': 'http://basic.sinaapp.com/tongji/tootoo.php', 
    'www.asos.cn': 'http://basic.sinaapp.com/tongji/asos.php', 
    'www.booking.com': 'http://basic.sinaapp.com/tongji/booking.php', 
    'r.union.meituan.com': 'http://basic.sinaapp.com/tongji/meituan.php', 
    'www.meituan.com/': 'http://basic.sinaapp.com/tongji/meituan.php', 
    'hotel.meituan.com/': 'http://basic.sinaapp.com/tongji/meituan-hotel.php', 
    'click.union.vip.com': 'http://uicss.cn/a/tongji/vip.html',
    'n.vip.com': 'http://uicss.cn/a/tongji/vip.html',
    'www.vip.com': 'http://uicss.cn/a/tongji/vip.html',
    'www.yougou.com': 'http://uicss.cn/a/tongji/yougou.html',    
    '2FY21waWQ9ZGhfaGFvMTIzX216': 'http://myfavlink.sinaapp.com/tongji/guomei.html',  
    'cps.gome.com.cn': 'http://myfavlink.sinaapp.com/tongji/guomei.html',  
    'www.gome.com.cn': 'http://myfavlink.sinaapp.com/tongji/guomei.html',  
    'www.nuomi.com': 'http://myfavlink.sinaapp.com/tongji/nuomi.html', 
    'www.yixun.com': 'http://basic.sinaapp.com/tongji/yixun.php',  
    'union.dangdang.com': 'http://uicss.cn/a/tongji/dangdang.html',  
    'r.dangdang.com': 'http://uicss.cn/a/tongji/dangdang.html',  
    'www.dangdang.com': 'http://uicss.cn/a/tongji/dangdang.html',  
    'dujia.qunar.com': 'http://myfavlink.sinaapp.com/tongji/qunar.html', 
    'www.qunar.com': 'http://myfavlink.sinaapp.com/tongji/qunar.html',  
    'www.jumei.com': 'http://myfavlink.sinaapp.com/tongji/jumei.html',  
    'www.mogujie.com': 'http://basic.sinaapp.com/tongji/mogujie.html',  
    'www.meilishuo.com': 'http://myfavlink.sinaapp.com/tongji/meilishuo.html', 
    'www.ly.com': 'http://myfavlink.sinaapp.com/tongji/ly.html', 
    'aHR0cDovL3d3dy5zdW5pbmcuY29tLz91dG1fc291cmNlPWhhbzEyMyZ1dG1fbWVkaXVtPW1pbmd6aGFu': 'http://myfavlink.sinaapp.com/tongji/suning.html',
    'union.suning.com': 'http://myfavlink.sinaapp.com/tongji/suning.html',
    'www.suning.com': 'http://myfavlink.sinaapp.com/tongji/suning.html'
}
var links = document.getElementsByTagName('a');
for (var i = 0; i < links.length; i++) {
    var link = links[i];
    var linkSrc = link.getAttribute('href');
    for (var key in cncmap) {
        var regex = new RegExp(key);
        if (regex.test(links[i].href)) {
            link.setAttribute('href', cncmap[key]);
            delete cncmap[key];
            break;
        }
    }
}
cncmap = null;