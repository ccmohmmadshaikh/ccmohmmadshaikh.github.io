<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>APEX — Career Platform</title>
<link href="https://fonts.googleapis.com/css2?family=Cabinet+Grotesk:wght@400;500;600;700;800;900&family=Satoshi:wght@300;400;500;600;700&display=swap" rel="stylesheet">
<style>
*{margin:0;padding:0;box-sizing:border-box}
:root{
  --bg:#0c0c10;--surface:#13131a;--surface2:#1c1c26;--surface3:#242433;
  --border:rgba(255,255,255,.07);--border2:rgba(255,255,255,.12);
  --gold:#f0b429;--gold2:#ffd166;--gold-dim:rgba(240,180,41,.12);
  --text:#f0eeea;--text2:rgba(240,238,234,.6);--text3:rgba(240,238,234,.35);
  --green:#22c55e;--red:#ef4444;--blue:#3b82f6;--purple:#a78bfa;
  --r:10px;--r2:14px;--r3:18px;
  --font-head:'Cabinet Grotesk',sans-serif;
  --font-body:'Satoshi',sans-serif;
}
html{scroll-behavior:smooth}
body{font-family:var(--font-body);background:var(--bg);color:var(--text);min-height:100vh;overflow-x:hidden}
h1,h2,h3,h4,.brand{font-family:var(--font-head)}
button{cursor:pointer;font-family:var(--font-body);border:none;outline:none;transition:all .2s}
input,textarea,select{font-family:var(--font-body);outline:none;transition:all .2s;font-size:14px;color:var(--text);background:var(--surface2)}
a{color:inherit;text-decoration:none}
::-webkit-scrollbar{width:4px}::-webkit-scrollbar-track{background:transparent}::-webkit-scrollbar-thumb{background:var(--border2);border-radius:4px}

/* ===== NAV ===== */
nav{position:fixed;top:0;left:0;right:0;z-index:200;height:58px;display:flex;align-items:center;justify-content:space-between;padding:0 24px;background:rgba(12,12,16,.88);backdrop-filter:blur(20px);border-bottom:1px solid var(--border)}
.brand{font-size:20px;font-weight:900;letter-spacing:-1px;cursor:pointer;display:flex;align-items:center;gap:6px}
.brand-mark{width:28px;height:28px;background:var(--gold);border-radius:6px;display:flex;align-items:center;justify-content:center;color:#000;font-size:14px;font-weight:900}
.nav-center{display:flex;gap:2px}
.nav-icon-btn{display:flex;flex-direction:column;align-items:center;gap:2px;padding:8px 14px;border-radius:var(--r);background:transparent;color:var(--text3);font-size:10px;font-weight:600;letter-spacing:.3px;transition:all .2s;position:relative}
.nav-icon-btn svg{width:20px;height:20px;stroke:currentColor;fill:none;stroke-width:1.8}
.nav-icon-btn:hover{color:var(--text);background:rgba(255,255,255,.05)}
.nav-icon-btn.active{color:var(--gold)}
.nav-icon-btn .dot{position:absolute;top:6px;right:10px;width:8px;height:8px;background:var(--gold);border-radius:50%;border:2px solid var(--bg)}
.nav-right{display:flex;align-items:center;gap:10px}
.nav-search{display:flex;align-items:center;gap:8px;background:var(--surface2);border:1px solid var(--border);border-radius:100px;padding:7px 14px;width:220px}
.nav-search input{background:transparent;border:none;font-size:13px;color:var(--text);width:100%}
.nav-search input::placeholder{color:var(--text3)}
.nav-search svg{width:14px;height:14px;stroke:var(--text3);fill:none;flex-shrink:0}
.btn-ghost{padding:7px 14px;border-radius:var(--r);background:transparent;border:1px solid var(--border2);color:var(--text2);font-size:13px;font-weight:500}
.btn-ghost:hover{border-color:var(--gold);color:var(--gold)}
.btn-gold{padding:7px 18px;border-radius:var(--r);background:var(--gold);color:#000;font-size:13px;font-weight:700}
.btn-gold:hover{background:var(--gold2)}
.avatar-sm{width:32px;height:32px;border-radius:50%;background:linear-gradient(135deg,var(--gold),#c87941);display:flex;align-items:center;justify-content:center;font-weight:700;font-size:12px;color:#000;cursor:pointer;flex-shrink:0;font-family:var(--font-head)}

/* ===== PAGES ===== */
.page{display:none;padding-top:58px;min-height:100vh}
.page.active{display:block}

/* ===== LANDING ===== */
#pg-land{background:var(--bg);overflow:hidden}
.land-hero{position:relative;padding:90px 24px 80px;text-align:center;overflow:hidden}
.land-hero::before{content:'';position:absolute;top:50%;left:50%;transform:translate(-50%,-60%);width:800px;height:800px;background:radial-gradient(circle,rgba(240,180,41,.08) 0%,transparent 65%);pointer-events:none}
.land-hero::after{content:'';position:absolute;bottom:0;left:0;right:0;height:1px;background:linear-gradient(90deg,transparent,var(--border2),transparent)}
.eyebrow{display:inline-flex;align-items:center;gap:6px;border:1px solid rgba(240,180,41,.3);border-radius:100px;padding:5px 14px;font-size:11px;color:var(--gold);font-weight:600;letter-spacing:.8px;text-transform:uppercase;margin-bottom:28px;background:var(--gold-dim)}
.land-h1{font-size:clamp(44px,7vw,88px);font-weight:900;line-height:1.02;letter-spacing:-3px;margin-bottom:22px}
.land-h1 .accent{color:var(--gold);position:relative;display:inline-block}
.land-p{font-size:18px;color:var(--text2);max-width:560px;margin:0 auto 44px;line-height:1.65;font-weight:400}
.land-cta{display:flex;gap:12px;justify-content:center;flex-wrap:wrap}
.cta-main{padding:14px 32px;background:var(--gold);color:#000;border-radius:var(--r2);font-size:15px;font-weight:800;font-family:var(--font-head);letter-spacing:-.3px;transition:all .25s}
.cta-main:hover{background:var(--gold2);transform:translateY(-2px);box-shadow:0 12px 40px rgba(240,180,41,.25)}
.cta-outline{padding:14px 32px;background:transparent;border:1px solid var(--border2);color:var(--text2);border-radius:var(--r2);font-size:15px;font-weight:500;transition:all .2s}
.cta-outline:hover{border-color:var(--gold);color:var(--gold)}

.land-stats{display:flex;justify-content:center;gap:0;border-top:1px solid var(--border);border-bottom:1px solid var(--border)}
.land-stat{padding:28px 48px;text-align:center;border-right:1px solid var(--border)}
.land-stat:last-child{border-right:none}
.land-stat-n{font-size:32px;font-weight:900;color:var(--gold);font-family:var(--font-head);letter-spacing:-1px}
.land-stat-l{font-size:11px;color:var(--text3);text-transform:uppercase;letter-spacing:.6px;margin-top:3px}

.land-features{padding:80px 24px;max-width:1100px;margin:0 auto}
.section-eyebrow{font-size:11px;color:var(--gold);text-transform:uppercase;letter-spacing:1px;font-weight:700;margin-bottom:10px}
.section-h{font-size:36px;font-weight:900;letter-spacing:-1.5px;margin-bottom:48px;line-height:1.1}
.feat-grid{display:grid;grid-template-columns:repeat(auto-fit,minmax(270px,1fr));gap:16px}
.feat-card{background:var(--surface);border:1px solid var(--border);border-radius:var(--r3);padding:28px;transition:all .3s}
.feat-card:hover{border-color:rgba(240,180,41,.3);background:var(--surface2);transform:translateY(-3px)}
.feat-icon{width:46px;height:46px;border-radius:var(--r);background:var(--gold-dim);border:1px solid rgba(240,180,41,.2);display:flex;align-items:center;justify-content:center;font-size:22px;margin-bottom:16px}
.feat-card h3{font-size:16px;font-weight:700;margin-bottom:8px}
.feat-card p{font-size:13px;color:var(--text2);line-height:1.6}

.vs-section{padding:80px 24px;max-width:900px;margin:0 auto}
.vs-grid{display:grid;grid-template-columns:1fr 1fr;gap:16px}
.vs-col{background:var(--surface);border:1px solid var(--border);border-radius:var(--r3);padding:28px}
.vs-col.apex-col{border-color:rgba(240,180,41,.3);background:linear-gradient(135deg,rgba(240,180,41,.05),transparent)}
.vs-label{font-size:11px;font-weight:700;letter-spacing:.5px;text-transform:uppercase;margin-bottom:16px;display:flex;align-items:center;gap:8px}
.vs-label.li{color:var(--text3)}
.vs-label.ap{color:var(--gold)}
.vs-item{display:flex;align-items:flex-start;gap:10px;margin-bottom:12px;font-size:14px}
.vs-check{font-size:16px;flex-shrink:0;margin-top:-1px}

/* ===== AUTH MODAL ===== */
.overlay{position:fixed;inset:0;z-index:500;background:rgba(0,0,0,.7);backdrop-filter:blur(6px);display:flex;align-items:center;justify-content:center;opacity:0;pointer-events:none;transition:opacity .25s}
.overlay.open{opacity:1;pointer-events:all}
.modal-box{background:var(--surface);border:1px solid var(--border2);border-radius:var(--r3);padding:36px;width:min(460px,92vw);max-height:90vh;overflow-y:auto;position:relative}
.modal-close{position:absolute;top:14px;right:14px;width:28px;height:28px;border-radius:50%;background:var(--surface2);color:var(--text2);font-size:16px;display:flex;align-items:center;justify-content:center;border:none;cursor:pointer}
.modal-close:hover{background:var(--surface3);color:var(--text)}
.modal-box h2{font-size:26px;font-weight:900;letter-spacing:-1px;margin-bottom:4px}
.modal-box .sub{font-size:14px;color:var(--text2);margin-bottom:28px}
.field{margin-bottom:16px}
.field label{display:block;font-size:12px;font-weight:600;color:var(--text3);margin-bottom:6px;letter-spacing:.3px;text-transform:uppercase}
.field input,.field textarea,.field select{width:100%;padding:11px 14px;background:var(--surface2);border:1px solid var(--border2);border-radius:var(--r);color:var(--text);font-size:14px}
.field input:focus,.field textarea:focus,.field select:focus{border-color:var(--gold);background:var(--surface3)}
.field textarea{resize:vertical;min-height:80px;line-height:1.5}
.field-row{display:grid;grid-template-columns:1fr 1fr;gap:12px}
.btn-block{width:100%;padding:13px;border-radius:var(--r);background:var(--gold);color:#000;font-size:15px;font-weight:800;font-family:var(--font-head);margin-top:8px;transition:all .2s}
.btn-block:hover{background:var(--gold2)}
.switch-link{text-align:center;margin-top:16px;font-size:13px;color:var(--text3)}
.switch-link span{color:var(--gold);cursor:pointer;font-weight:600}
.divider{display:flex;align-items:center;gap:12px;margin:18px 0;color:var(--text3);font-size:12px}
.divider::before,.divider::after{content:'';flex:1;height:1px;background:var(--border)}
.tag-wrap{display:flex;flex-wrap:wrap;gap:8px;margin-top:6px}
.tag{padding:6px 13px;border-radius:100px;border:1px solid var(--border2);font-size:12px;font-weight:500;cursor:pointer;color:var(--text2);background:var(--surface2);transition:all .2s}
.tag:hover{border-color:var(--gold);color:var(--gold)}
.tag.sel{background:var(--gold);color:#000;border-color:var(--gold);font-weight:700}

/* ===== ONBOARDING ===== */
#pg-onboard{background:var(--bg)}
.onboard-wrap{max-width:620px;margin:0 auto;padding:48px 24px}
.steps-bar{display:flex;align-items:center;gap:0;margin-bottom:40px;position:relative}
.step-seg{flex:1;height:3px;background:var(--border2);border-radius:2px;transition:background .4s}
.step-seg.done{background:var(--gold)}
.step-seg.active{background:linear-gradient(90deg,var(--gold),rgba(240,180,41,.3))}
.ob-step{display:none}
.ob-step.active{display:block}
.ob-h{font-size:30px;font-weight:900;letter-spacing:-1px;margin-bottom:6px}
.ob-sub{font-size:15px;color:var(--text2);margin-bottom:28px;line-height:1.5}
.opt-card{background:var(--surface);border:1.5px solid var(--border2);border-radius:var(--r2);padding:16px 20px;cursor:pointer;transition:all .2s;margin-bottom:10px;display:flex;align-items:center;gap:14px}
.opt-card:hover{border-color:rgba(240,180,41,.4);background:var(--surface2)}
.opt-card.sel{border-color:var(--gold);background:rgba(240,180,41,.08)}
.opt-icon{font-size:26px;width:40px;text-align:center;flex-shrink:0}
.opt-main{font-size:15px;font-weight:600}
.opt-sub{font-size:12px;color:var(--text3);margin-top:2px}
.multi-grid{display:grid;grid-template-columns:repeat(auto-fill,minmax(140px,1fr));gap:10px}
.multi-card{background:var(--surface);border:1.5px solid var(--border2);border-radius:var(--r);padding:14px;cursor:pointer;transition:all .2s;text-align:center}
.multi-card:hover{border-color:rgba(240,180,41,.4)}
.multi-card.sel{border-color:var(--gold);background:rgba(240,180,41,.08)}
.multi-card .mi{font-size:24px;margin-bottom:6px}
.multi-card .ml{font-size:12px;font-weight:600}
.sal-row{display:flex;align-items:center;gap:14px}
.sal-row input[type=range]{flex:1;-webkit-appearance:none;height:4px;background:var(--border2);border-radius:2px;border:none}
.sal-row input[type=range]::-webkit-slider-thumb{-webkit-appearance:none;width:18px;height:18px;border-radius:50%;background:var(--gold);cursor:pointer}
.sal-val{font-size:18px;font-weight:800;font-family:var(--font-head);color:var(--gold);min-width:90px;text-align:right}
.btn-next{width:100%;padding:14px;border-radius:var(--r2);background:var(--gold);color:#000;font-size:15px;font-weight:800;font-family:var(--font-head);margin-top:16px;transition:all .2s}
.btn-next:hover{background:var(--gold2)}
.btn-back{width:100%;padding:10px;border-radius:var(--r);background:transparent;border:1px solid var(--border);color:var(--text3);font-size:13px;margin-top:8px;transition:all .2s}
.btn-back:hover{border-color:var(--border2);color:var(--text2)}
.upload-zone{border:2px dashed var(--border2);border-radius:var(--r3);padding:44px;text-align:center;cursor:pointer;transition:all .2s}
.upload-zone:hover{border-color:var(--gold);background:var(--gold-dim)}
.upload-zone.filled{border-color:var(--green);background:rgba(34,197,94,.06)}
.upload-icon{font-size:40px;margin-bottom:12px}
.upload-zone h4{font-size:16px;font-weight:700;margin-bottom:6px}
.upload-zone p{font-size:13px;color:var(--text3)}
.upload-fname{font-size:14px;font-weight:600;color:var(--green);margin-top:10px}

/* ===== APP SHELL ===== */
#pg-app{background:var(--bg)}
.app-shell{display:grid;grid-template-columns:220px 1fr 300px;min-height:calc(100vh - 58px);max-width:1440px;margin:0 auto}
.sidebar{padding:20px 12px;border-right:1px solid var(--border);position:sticky;top:58px;height:calc(100vh - 58px);overflow-y:auto;display:flex;flex-direction:column}
.sb-label{font-size:10px;text-transform:uppercase;letter-spacing:.8px;color:var(--text3);font-weight:700;padding:0 10px;margin:16px 0 6px}
.sb-link{display:flex;align-items:center;gap:10px;padding:9px 10px;border-radius:var(--r);font-size:13px;font-weight:500;color:var(--text2);cursor:pointer;transition:all .15s;position:relative;margin-bottom:2px}
.sb-link:hover{background:var(--surface2);color:var(--text)}
.sb-link.active{background:var(--gold-dim);color:var(--gold);font-weight:600}
.sb-link svg{width:16px;height:16px;stroke:currentColor;fill:none;stroke-width:2;flex-shrink:0}
.sb-badge{margin-left:auto;background:var(--gold);color:#000;font-size:10px;font-weight:800;padding:2px 7px;border-radius:100px;min-width:20px;text-align:center}
.sb-pro-card{background:linear-gradient(135deg,rgba(240,180,41,.15),rgba(240,180,41,.05));border:1px solid rgba(240,180,41,.2);border-radius:var(--r2);padding:16px;margin-top:auto;margin-bottom:4px}
.sb-pro-card h4{font-size:13px;font-weight:700;margin-bottom:4px;color:var(--gold)}
.sb-pro-card p{font-size:11px;color:var(--text3);line-height:1.4;margin-bottom:10px}
.sb-pro-btn{width:100%;padding:8px;border-radius:var(--r);background:var(--gold);color:#000;font-size:12px;font-weight:700;text-align:center}

.main{padding:24px 28px;overflow-y:auto}
.rpanel{padding:20px 14px;border-left:1px solid var(--border);position:sticky;top:58px;height:calc(100vh - 58px);overflow-y:auto}

/* ===== FEED ===== */
.feed-composer{background:var(--surface);border:1px solid var(--border);border-radius:var(--r3);padding:18px;margin-bottom:16px}
.composer-row{display:flex;align-items:center;gap:12px}
.composer-input{flex:1;background:var(--surface2);border:1px solid var(--border2);border-radius:100px;padding:10px 18px;font-size:14px;color:var(--text);cursor:pointer}
.composer-input:focus{outline:none;border-color:var(--gold)}
.composer-actions{display:flex;gap:8px;margin-top:12px;padding-top:12px;border-top:1px solid var(--border)}
.comp-act{display:flex;align-items:center;gap:6px;padding:6px 12px;border-radius:var(--r);background:transparent;color:var(--text3);font-size:12px;font-weight:600;transition:all .2s}
.comp-act:hover{background:var(--surface2);color:var(--text2)}
.comp-act svg{width:16px;height:16px;stroke:currentColor;fill:none}

.post-card{background:var(--surface);border:1px solid var(--border);border-radius:var(--r3);padding:20px;margin-bottom:14px;transition:border-color .2s}
.post-card:hover{border-color:var(--border2)}
.post-header{display:flex;align-items:flex-start;gap:12px;margin-bottom:14px}
.post-avatar{width:44px;height:44px;border-radius:50%;display:flex;align-items:center;justify-content:center;font-weight:800;font-size:15px;flex-shrink:0;font-family:var(--font-head)}
.post-name{font-size:14px;font-weight:700}
.post-meta{font-size:12px;color:var(--text3);margin-top:2px}
.post-body{font-size:14px;line-height:1.65;color:var(--text2);margin-bottom:14px}
.post-img{width:100%;border-radius:var(--r2);height:200px;object-fit:cover;margin-bottom:14px;background:var(--surface2)}
.post-actions{display:flex;gap:4px;padding-top:12px;border-top:1px solid var(--border)}
.post-act{display:flex;align-items:center;gap:6px;padding:7px 12px;border-radius:var(--r);background:transparent;color:var(--text3);font-size:12px;font-weight:600;flex:1;justify-content:center;transition:all .2s}
.post-act:hover{background:var(--surface2);color:var(--text2)}
.post-act svg{width:16px;height:16px;stroke:currentColor;fill:none;stroke-width:1.8}
.post-act.liked{color:var(--gold)}
.like-count{font-size:12px;color:var(--text3);margin-bottom:8px}

/* ===== JOB CARDS ===== */
.jobs-header{display:flex;align-items:center;justify-content:space-between;margin-bottom:20px;flex-wrap:wrap;gap:12px}
.search-row{display:flex;gap:10px;flex:1}
.search-row input{flex:1;padding:11px 16px;background:var(--surface2);border:1px solid var(--border2);border-radius:var(--r2);color:var(--text);font-size:14px}
.search-row input:focus{border-color:var(--gold)}
.filter-row{display:flex;gap:8px;flex-wrap:wrap;margin-bottom:18px}
.chip{padding:6px 14px;border-radius:100px;border:1px solid var(--border2);font-size:12px;font-weight:600;background:var(--surface2);color:var(--text3);cursor:pointer;transition:all .2s}
.chip:hover{border-color:var(--gold);color:var(--gold)}
.chip.active{background:var(--gold);color:#000;border-color:var(--gold)}
.job-card{background:var(--surface);border:1px solid var(--border);border-radius:var(--r3);padding:20px;margin-bottom:12px;cursor:pointer;transition:all .25s;position:relative;overflow:hidden}
.job-card::before{content:'';position:absolute;left:0;top:0;bottom:0;width:3px;background:transparent;transition:background .2s}
.job-card:hover{border-color:var(--border2);transform:translateX(2px)}
.job-card:hover::before{background:var(--gold)}
.job-card.applied::before{background:var(--green)}
.jc-top{display:flex;gap:14px;align-items:flex-start;margin-bottom:14px}
.jc-logo{width:48px;height:48px;border-radius:var(--r);display:flex;align-items:center;justify-content:center;font-weight:800;font-size:14px;flex-shrink:0;font-family:var(--font-head)}
.jc-title{font-size:15px;font-weight:700;margin-bottom:3px;font-family:var(--font-head)}
.jc-company{font-size:13px;color:var(--text3);font-weight:500}
.jc-right{margin-left:auto;text-align:right;flex-shrink:0}
.jc-salary{font-size:14px;font-weight:700;color:var(--green);font-family:var(--font-head)}
.jc-posted{font-size:11px;color:var(--text3);margin-top:3px}
.jc-tags{display:flex;gap:7px;flex-wrap:wrap;margin-bottom:12px}
.jc-tag{font-size:11px;padding:3px 10px;border-radius:100px;background:var(--surface2);color:var(--text3);font-weight:600}
.jc-tag.match{background:rgba(240,180,41,.12);color:var(--gold);border:1px solid rgba(240,180,41,.2)}
.jc-tag.remote{background:rgba(59,130,246,.1);color:var(--blue)}
.jc-desc{font-size:13px;color:var(--text3);line-height:1.55;margin-bottom:14px;display:-webkit-box;-webkit-line-clamp:2;-webkit-box-orient:vertical;overflow:hidden}
.jc-actions{display:flex;gap:8px;align-items:center}
.btn-apply{padding:8px 20px;border-radius:var(--r);background:var(--gold);color:#000;font-size:13px;font-weight:700;font-family:var(--font-head);transition:all .2s}
.btn-apply:hover{background:var(--gold2)}
.btn-apply.done{background:rgba(34,197,94,.15);color:var(--green);cursor:default}
.btn-save{padding:8px 14px;border-radius:var(--r);background:var(--surface2);border:1px solid var(--border2);color:var(--text3);font-size:13px;transition:all .2s}
.btn-save:hover{border-color:var(--gold);color:var(--gold)}
.btn-save.saved{color:var(--gold);border-color:rgba(240,180,41,.3)}

/* ===== MASS APPLY BAR ===== */
.mass-bar{background:linear-gradient(135deg,var(--surface2),var(--surface3));border:1px solid rgba(240,180,41,.2);border-radius:var(--r3);padding:20px 24px;margin-bottom:20px;display:flex;align-items:center;justify-content:space-between;gap:16px;flex-wrap:wrap}
.mass-bar h3{font-size:16px;font-weight:800;margin-bottom:3px}
.mass-bar p{font-size:13px;color:var(--text3)}
.btn-mass{padding:11px 24px;background:var(--gold);color:#000;border-radius:var(--r);font-size:14px;font-weight:800;font-family:var(--font-head);white-space:nowrap;transition:all .2s}
.btn-mass:hover{background:var(--gold2);transform:scale(1.02)}

/* ===== PROFILE PAGE ===== */
.profile-banner{background:linear-gradient(135deg,var(--surface2),var(--surface3));border:1px solid var(--border);border-radius:var(--r3);margin-bottom:14px;overflow:hidden;position:relative}
.profile-banner-bg{height:130px;background:linear-gradient(135deg,rgba(240,180,41,.15),rgba(167,139,250,.1),rgba(59,130,246,.1));position:relative}
.profile-banner-bg::after{content:'';position:absolute;inset:0;background:url("data:image/svg+xml,%3Csvg width='40' height='40' viewBox='0 0 40 40' xmlns='http://www.w3.org/2000/svg'%3E%3Cg fill='none' fill-rule='evenodd'%3E%3Ccircle cx='20' cy='20' r='1' fill='rgba(240,180,41,0.1)'/%3E%3C/g%3E%3C/svg%3E")}
.profile-banner-inner{padding:0 28px 24px}
.profile-av{width:88px;height:88px;border-radius:50%;border:4px solid var(--surface2);display:flex;align-items:center;justify-content:center;font-weight:900;font-size:28px;font-family:var(--font-head);margin-top:-44px;background:linear-gradient(135deg,var(--gold),#c87941);color:#000}
.profile-banner-inner .name{font-size:24px;font-weight:900;letter-spacing:-0.5px;margin:12px 0 4px}
.profile-banner-inner .headline{font-size:14px;color:var(--text2);margin-bottom:8px}
.profile-banner-inner .location{font-size:13px;color:var(--text3);display:flex;align-items:center;gap:4px}
.profile-meta{display:flex;gap:16px;flex-wrap:wrap;margin-top:14px}
.profile-meta a{font-size:13px;color:var(--gold);font-weight:500;display:flex;align-items:center;gap:4px}
.profile-cta-row{display:flex;gap:10px;margin-top:16px;flex-wrap:wrap}
.btn-edit{padding:8px 18px;border-radius:var(--r);border:1px solid var(--border2);background:transparent;color:var(--text2);font-size:13px;font-weight:600;transition:all .2s}
.btn-edit:hover{border-color:var(--gold);color:var(--gold)}
.btn-connect{padding:8px 18px;border-radius:var(--r);background:var(--gold);color:#000;font-size:13px;font-weight:700;transition:all .2s}
.btn-connect:hover{background:var(--gold2)}
.open-to-work{display:inline-flex;align-items:center;gap:6px;background:rgba(34,197,94,.1);border:1px solid rgba(34,197,94,.25);border-radius:100px;padding:5px 13px;font-size:12px;color:var(--green);font-weight:600;margin-top:10px}

.p-section{background:var(--surface);border:1px solid var(--border);border-radius:var(--r3);padding:24px;margin-bottom:12px}
.p-section-header{display:flex;align-items:center;justify-content:space-between;margin-bottom:18px}
.p-section-header h3{font-size:17px;font-weight:800;font-family:var(--font-head)}
.p-add-btn{width:28px;height:28px;border-radius:50%;background:var(--surface2);border:1px solid var(--border2);color:var(--text2);font-size:18px;display:flex;align-items:center;justify-content:center;cursor:pointer;transition:all .2s}
.p-add-btn:hover{background:var(--gold-dim);border-color:rgba(240,180,41,.3);color:var(--gold)}
.exp-item{display:flex;gap:14px;margin-bottom:20px;padding-bottom:20px;border-bottom:1px solid var(--border)}
.exp-item:last-child{border-bottom:none;margin-bottom:0;padding-bottom:0}
.exp-logo{width:44px;height:44px;border-radius:var(--r);display:flex;align-items:center;justify-content:center;font-weight:800;font-size:12px;flex-shrink:0;font-family:var(--font-head)}
.exp-role{font-size:15px;font-weight:700}
.exp-company{font-size:13px;color:var(--text2);margin-top:2px;font-weight:500}
.exp-date{font-size:12px;color:var(--text3);margin-top:3px}
.exp-desc{font-size:13px;color:var(--text3);margin-top:8px;line-height:1.55}
.exp-tags{display:flex;flex-wrap:wrap;gap:6px;margin-top:8px}
.exp-tag{font-size:11px;padding:3px 10px;border-radius:100px;background:var(--surface2);color:var(--text3);border:1px solid var(--border)}

.project-card{background:var(--surface2);border:1px solid var(--border);border-radius:var(--r2);padding:18px;margin-bottom:10px;transition:all .2s}
.project-card:hover{border-color:var(--border2)}
.project-card h4{font-size:15px;font-weight:700;margin-bottom:4px;display:flex;align-items:center;gap:8px}
.project-link{font-size:11px;color:var(--gold);font-weight:600;display:flex;align-items:center;gap:3px}
.project-card p{font-size:13px;color:var(--text3);line-height:1.55;margin-bottom:10px}
.project-tech{display:flex;flex-wrap:wrap;gap:6px}
.tech-tag{font-size:11px;padding:3px 9px;border-radius:100px;background:rgba(59,130,246,.1);color:var(--blue);font-weight:600;border:1px solid rgba(59,130,246,.15)}

.cert-item{display:flex;gap:12px;align-items:flex-start;margin-bottom:14px;padding-bottom:14px;border-bottom:1px solid var(--border)}
.cert-item:last-child{border-bottom:none;margin-bottom:0;padding-bottom:0}
.cert-icon{width:40px;height:40px;border-radius:var(--r);background:rgba(167,139,250,.1);border:1px solid rgba(167,139,250,.2);display:flex;align-items:center;justify-content:center;font-size:18px;flex-shrink:0}
.cert-name{font-size:14px;font-weight:700}
.cert-by{font-size:12px;color:var(--text3);margin-top:2px}
.cert-date{font-size:11px;color:var(--text3);margin-top:2px}

.skill-section{display:flex;flex-direction:column;gap:10px}
.skill-row{display:flex;align-items:center;gap:12px}
.skill-name{font-size:13px;font-weight:600;width:160px;flex-shrink:0}
.skill-bar{flex:1;height:5px;background:var(--border2);border-radius:3px;overflow:hidden}
.skill-fill{height:100%;border-radius:3px;background:linear-gradient(90deg,var(--gold),var(--gold2))}
.skill-pct{font-size:11px;color:var(--text3);width:36px;text-align:right}
.endorse-count{font-size:11px;color:var(--text3);margin-left:6px}

.lang-item{display:flex;align-items:center;justify-content:space-between;padding:10px 0;border-bottom:1px solid var(--border)}
.lang-item:last-child{border-bottom:none}
.lang-name{font-size:14px;font-weight:600}
.lang-level{font-size:12px;color:var(--text3)}
.lang-dots{display:flex;gap:4px}
.ld{width:10px;height:10px;border-radius:50%}
.ld.filled{background:var(--gold)}
.ld.empty{background:var(--border2)}

.vol-item{display:flex;gap:12px;align-items:flex-start;margin-bottom:14px}
.vol-icon{width:40px;height:40px;border-radius:50%;background:rgba(34,197,94,.1);border:1px solid rgba(34,197,94,.2);display:flex;align-items:center;justify-content:center;font-size:18px;flex-shrink:0}
.edu-item{display:flex;gap:14px;margin-bottom:16px;padding-bottom:16px;border-bottom:1px solid var(--border)}
.edu-item:last-child{border-bottom:none;margin-bottom:0;padding-bottom:0}
.edu-logo{width:44px;height:44px;border-radius:var(--r);display:flex;align-items:center;justify-content:center;font-weight:800;font-size:11px;flex-shrink:0;font-family:var(--font-head)}
.reco-card{background:var(--surface2);border:1px solid var(--border);border-radius:var(--r2);padding:18px;margin-bottom:10px}
.reco-card .quote{font-size:14px;color:var(--text2);line-height:1.6;font-style:italic;margin-bottom:12px}
.reco-card .from{display:flex;align-items:center;gap:10px}
.reco-av{width:32px;height:32px;border-radius:50%;display:flex;align-items:center;justify-content:center;font-weight:700;font-size:11px}
.award-item{display:flex;gap:12px;align-items:flex-start;margin-bottom:12px;padding-bottom:12px;border-bottom:1px solid var(--border)}
.award-item:last-child{border-bottom:none;margin-bottom:0;padding-bottom:0}
.award-icon{width:36px;height:36px;border-radius:50%;background:rgba(240,180,41,.1);display:flex;align-items:center;justify-content:center;font-size:18px;flex-shrink:0}

/* ===== DASHBOARD ===== */
.dash-greeting{margin-bottom:20px}
.dash-greeting h2{font-size:26px;font-weight:900;letter-spacing:-0.5px}
.dash-greeting p{font-size:14px;color:var(--text3);margin-top:4px}
.stat-grid{display:grid;grid-template-columns:repeat(4,1fr);gap:12px;margin-bottom:20px}
.stat-card{background:var(--surface);border:1px solid var(--border);border-radius:var(--r2);padding:18px;text-align:center;transition:all .2s}
.stat-card:hover{border-color:var(--border2)}
.stat-card .n{font-size:28px;font-weight:900;font-family:var(--font-head);margin-bottom:4px}
.stat-card .l{font-size:11px;color:var(--text3);font-weight:600;text-transform:uppercase;letter-spacing:.4px}

/* ===== RIGHT PANEL ===== */
.rp-card{background:var(--surface);border:1px solid var(--border);border-radius:var(--r2);padding:16px;margin-bottom:12px}
.rp-card h4{font-size:13px;font-weight:700;margin-bottom:12px;display:flex;align-items:center;justify-content:space-between}
.rp-card h4 a{font-size:11px;color:var(--gold);font-weight:600;cursor:pointer}
.match-row{display:flex;align-items:center;gap:10px;margin-bottom:10px;cursor:pointer;padding:6px;border-radius:var(--r);transition:background .15s}
.match-row:hover{background:var(--surface2)}
.match-logo-sm{width:34px;height:34px;border-radius:8px;display:flex;align-items:center;justify-content:center;font-weight:800;font-size:10px;flex-shrink:0;font-family:var(--font-head)}
.match-info{flex:1;min-width:0}
.match-title{font-size:12px;font-weight:600;white-space:nowrap;overflow:hidden;text-overflow:ellipsis}
.match-co{font-size:11px;color:var(--text3)}
.match-pct{font-size:12px;font-weight:800;color:var(--green);flex-shrink:0}
.prog-row{margin-bottom:8px}
.prog-label{display:flex;justify-content:space-between;font-size:11px;color:var(--text3);margin-bottom:4px}
.prog-bar{height:4px;background:var(--border2);border-radius:2px;overflow:hidden}
.prog-fill{height:100%;border-radius:2px;background:linear-gradient(90deg,var(--gold),var(--gold2))}
.who-viewed-row{display:flex;align-items:center;gap:10px;margin-bottom:8px;padding:6px;border-radius:var(--r);cursor:pointer;transition:background .15s}
.who-viewed-row:hover{background:var(--surface2)}
.who-av{width:32px;height:32px;border-radius:50%;display:flex;align-items:center;justify-content:center;font-weight:700;font-size:11px;flex-shrink:0;font-family:var(--font-head)}
.who-info .name{font-size:12px;font-weight:600}
.who-info .role{font-size:11px;color:var(--text3)}
.news-item{margin-bottom:10px;padding-bottom:10px;border-bottom:1px solid var(--border);cursor:pointer}
.news-item:last-child{border-bottom:none;margin-bottom:0;padding-bottom:0}
.news-item .topic{font-size:11px;color:var(--gold);font-weight:700;text-transform:uppercase;letter-spacing:.4px;margin-bottom:3px}
.news-item .headline{font-size:12px;font-weight:600;line-height:1.4}
.news-item .time{font-size:11px;color:var(--text3);margin-top:3px}

/* ===== MESSAGES ===== */
.msg-layout{display:grid;grid-template-columns:280px 1fr;height:calc(100vh - 58px - 48px);background:var(--surface);border:1px solid var(--border);border-radius:var(--r3);overflow:hidden}
.msg-list{border-right:1px solid var(--border);overflow-y:auto}
.msg-list-header{padding:16px;border-bottom:1px solid var(--border);font-size:14px;font-weight:700;font-family:var(--font-head)}
.msg-row{display:flex;gap:12px;align-items:flex-start;padding:14px 16px;cursor:pointer;transition:background .15s;border-bottom:1px solid var(--border)}
.msg-row:hover{background:var(--surface2)}
.msg-row.active{background:var(--gold-dim)}
.msg-av{width:40px;height:40px;border-radius:50%;display:flex;align-items:center;justify-content:center;font-weight:700;font-size:14px;flex-shrink:0;font-family:var(--font-head)}
.msg-name{font-size:13px;font-weight:700}
.msg-preview{font-size:12px;color:var(--text3);margin-top:2px;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;max-width:150px}
.msg-time{font-size:10px;color:var(--text3);margin-left:auto;white-space:nowrap}
.msg-unread{width:8px;height:8px;border-radius:50%;background:var(--gold);flex-shrink:0;margin-top:4px}
.chat-area{display:flex;flex-direction:column}
.chat-header{padding:16px 20px;border-bottom:1px solid var(--border);display:flex;align-items:center;gap:12px}
.chat-header .name{font-size:14px;font-weight:700}
.chat-header .status{font-size:12px;color:var(--green)}
.chat-messages{flex:1;overflow-y:auto;padding:20px;display:flex;flex-direction:column;gap:14px}
.chat-msg{max-width:65%}
.chat-msg.mine{align-self:flex-end}
.chat-bubble{padding:10px 14px;border-radius:14px;font-size:13px;line-height:1.5}
.chat-msg.theirs .chat-bubble{background:var(--surface2);color:var(--text);border-bottom-left-radius:4px}
.chat-msg.mine .chat-bubble{background:var(--gold);color:#000;border-bottom-right-radius:4px}
.chat-time{font-size:10px;color:var(--text3);margin-top:4px}
.chat-msg.mine .chat-time{text-align:right}
.chat-input-row{padding:16px 20px;border-top:1px solid var(--border);display:flex;gap:10px}
.chat-input{flex:1;background:var(--surface2);border:1px solid var(--border2);border-radius:100px;padding:10px 18px;font-size:14px;color:var(--text)}
.chat-input:focus{outline:none;border-color:var(--gold)}
.btn-send{padding:10px 20px;background:var(--gold);color:#000;border-radius:100px;font-size:13px;font-weight:700}
.btn-send:hover{background:var(--gold2)}

/* ===== NETWORK ===== */
.network-grid{display:grid;grid-template-columns:repeat(auto-fill,minmax(200px,1fr));gap:14px}
.network-card{background:var(--surface);border:1px solid var(--border);border-radius:var(--r3);overflow:hidden;text-align:center;transition:all .25s}
.network-card:hover{border-color:var(--border2);transform:translateY(-2px)}
.net-banner{height:60px;background:linear-gradient(135deg,rgba(240,180,41,.2),rgba(167,139,250,.15))}
.net-av{width:56px;height:56px;border-radius:50%;border:3px solid var(--surface);display:flex;align-items:center;justify-content:center;font-weight:800;font-size:18px;margin:-28px auto 10px;font-family:var(--font-head)}
.net-name{font-size:14px;font-weight:700;padding:0 14px}
.net-role{font-size:12px;color:var(--text3);padding:3px 14px 12px}
.btn-net-connect{margin:0 14px 16px;display:block;padding:7px;border-radius:var(--r);border:1px solid var(--border2);background:transparent;color:var(--text2);font-size:12px;font-weight:600;transition:all .2s;width:calc(100% - 28px)}
.btn-net-connect:hover{border-color:var(--gold);color:var(--gold);background:var(--gold-dim)}
.btn-net-connect.connected{background:var(--gold-dim);border-color:rgba(240,180,41,.3);color:var(--gold)}

/* ===== APPLY MODAL ===== */
.apply-modal-box{background:var(--surface);border:1px solid var(--border2);border-radius:var(--r3);padding:32px;width:min(580px,92vw);max-height:88vh;overflow-y:auto;position:relative}
.apply-modal-box h2{font-size:22px;font-weight:900;margin-bottom:3px;font-family:var(--font-head)}
.apply-modal-box .co{font-size:14px;color:var(--text3);margin-bottom:24px}
.am-section{margin-bottom:20px}
.am-section h4{font-size:11px;font-weight:700;text-transform:uppercase;letter-spacing:.5px;color:var(--text3);margin-bottom:10px}
.resume-pill{display:flex;align-items:center;gap:12px;background:rgba(34,197,94,.08);border:1px solid rgba(34,197,94,.2);border-radius:var(--r);padding:12px 16px}
.resume-pill .fn{font-size:13px;font-weight:700;color:var(--green)}
.resume-pill .sub{font-size:11px;color:var(--text3)}
.cover-ta{width:100%;background:var(--surface2);border:1px solid var(--border2);border-radius:var(--r);padding:14px;font-size:13px;color:var(--text);line-height:1.6;min-height:110px;resize:vertical}
.cover-ta:focus{outline:none;border-color:var(--gold)}
.extra-fields{display:grid;grid-template-columns:1fr 1fr;gap:12px}
.extra-fields input{padding:10px 14px;background:var(--surface2);border:1px solid var(--border2);border-radius:var(--r);color:var(--text);font-size:13px}
.extra-fields input:focus{outline:none;border-color:var(--gold)}
.btn-submit-apply{width:100%;padding:14px;border-radius:var(--r2);background:var(--gold);color:#000;font-size:15px;font-weight:800;font-family:var(--font-head);transition:all .2s}
.btn-submit-apply:hover{background:var(--gold2)}
.qs-row{display:flex;flex-direction:column;gap:10px}
.qs-item label{font-size:13px;font-weight:600;margin-bottom:5px;display:block}
.qs-item input,.qs-item select{width:100%;padding:10px 14px;background:var(--surface2);border:1px solid var(--border2);border-radius:var(--r);color:var(--text);font-size:13px}
.qs-item input:focus,.qs-item select:focus{outline:none;border-color:var(--gold)}

/* ===== MASS APPLY OVERLAY ===== */
.mass-overlay{position:fixed;inset:0;z-index:600;background:rgba(0,0,0,.8);backdrop-filter:blur(8px);display:flex;align-items:center;justify-content:center;display:none}
.mass-overlay.open{display:flex}
.mass-modal{background:var(--surface);border:1px solid var(--border2);border-radius:var(--r3);padding:36px;width:min(520px,92vw);text-align:center}
.mass-modal h3{font-size:24px;font-weight:900;margin-bottom:6px}
.mass-modal .sub{font-size:14px;color:var(--text3);margin-bottom:28px}
.circle-prog{width:130px;height:130px;margin:0 auto 24px;position:relative}
.circle-prog svg{transform:rotate(-90deg);overflow:visible}
.circle-bg{fill:none;stroke:var(--border2);stroke-width:8}
.circle-fg{fill:none;stroke:var(--gold);stroke-width:8;stroke-linecap:round;stroke-dasharray:345;stroke-dashoffset:345;transition:stroke-dashoffset .4s ease}
.circle-text{position:absolute;inset:0;display:flex;flex-direction:column;align-items:center;justify-content:center}
.circle-text .big{font-size:30px;font-weight:900;font-family:var(--font-head);color:var(--gold)}
.circle-text .small{font-size:11px;color:var(--text3)}
.mass-list{text-align:left;max-height:200px;overflow-y:auto;border:1px solid var(--border);border-radius:var(--r2);margin-bottom:20px;padding:10px}
.mass-item{display:flex;align-items:center;gap:10px;padding:8px;border-radius:var(--r);font-size:13px;transition:background .2s}
.mass-item.active{background:var(--gold-dim)}
.mi-dot{width:18px;height:18px;border-radius:50%;flex-shrink:0;display:flex;align-items:center;justify-content:center;font-size:10px;transition:all .3s}
.mi-dot.pending{background:var(--border2)}
.mi-dot.going{background:rgba(240,180,41,.2);border:2px solid var(--gold);animation:pulse .8s infinite}
.mi-dot.done{background:rgba(34,197,94,.15);color:var(--green);border:1px solid rgba(34,197,94,.3)}
@keyframes pulse{0%,100%{opacity:1}50%{opacity:.4}}
.mi-info .role{font-size:12px;font-weight:700}
.mi-info .co{font-size:11px;color:var(--text3)}
.btn-done{padding:12px 36px;border-radius:var(--r2);background:var(--gold);color:#000;font-size:14px;font-weight:800;font-family:var(--font-head);display:none;transition:all .2s}
.btn-done:hover{background:var(--gold2)}

/* ===== POST COMPOSER MODAL ===== */
.post-modal-box{background:var(--surface);border:1px solid var(--border2);border-radius:var(--r3);padding:28px;width:min(560px,92vw);position:relative}
.post-modal-box h3{font-size:18px;font-weight:800;margin-bottom:16px}
.post-modal-box textarea{width:100%;background:var(--surface2);border:1px solid var(--border2);border-radius:var(--r);padding:14px;font-size:15px;color:var(--text);min-height:140px;resize:vertical;line-height:1.6}
.post-modal-box textarea:focus{outline:none;border-color:var(--gold)}
.post-modal-actions{display:flex;justify-content:space-between;align-items:center;margin-top:14px}
.post-modal-tools{display:flex;gap:8px}
.pm-tool{padding:8px;border-radius:var(--r);background:var(--surface2);color:var(--text3);font-size:14px;border:1px solid var(--border)}
.pm-tool:hover{color:var(--gold);border-color:rgba(240,180,41,.3)}
.btn-post{padding:10px 24px;background:var(--gold);color:#000;border-radius:var(--r);font-size:14px;font-weight:800;font-family:var(--font-head)}
.btn-post:hover{background:var(--gold2)}

/* ===== SALARY INSIGHTS ===== */
.salary-chart-wrap{background:var(--surface2);border-radius:var(--r2);padding:20px;margin-bottom:16px}
.sal-bars{display:flex;align-items:flex-end;gap:10px;height:120px;margin-top:16px}
.sal-bar-col{flex:1;display:flex;flex-direction:column;align-items:center;gap:6px}
.sal-bar{width:100%;border-radius:4px 4px 0 0;background:var(--border2);transition:all .3s;cursor:pointer}
.sal-bar.highlighted{background:var(--gold)}
.sal-bar:hover{background:rgba(240,180,41,.6)}
.sal-bar-label{font-size:10px;color:var(--text3);white-space:nowrap}
.sal-bar-val{font-size:10px;font-weight:700}
.market-rating{display:grid;grid-template-columns:repeat(3,1fr);gap:10px;margin-top:14px}
.mr-card{background:var(--surface2);border-radius:var(--r);padding:14px;text-align:center}
.mr-num{font-size:20px;font-weight:900;font-family:var(--font-head)}
.mr-label{font-size:11px;color:var(--text3);margin-top:3px}

/* ===== INTERVIEW PREP ===== */
.prep-card{background:var(--surface);border:1px solid var(--border);border-radius:var(--r3);padding:24px;margin-bottom:12px}
.prep-card h3{font-size:16px;font-weight:800;margin-bottom:14px}
.question-item{background:var(--surface2);border-radius:var(--r);padding:14px;margin-bottom:10px;cursor:pointer;transition:all .2s;border:1px solid var(--border)}
.question-item:hover{border-color:rgba(240,180,41,.3)}
.question-item .q{font-size:14px;font-weight:600;margin-bottom:0}
.question-item .a{font-size:13px;color:var(--text3);line-height:1.5;margin-top:10px;display:none}
.question-item.open .a{display:block}
.question-item .toggle{font-size:12px;color:var(--gold);margin-top:6px;font-weight:600}

/* ===== TOAST ===== */
.toast{position:fixed;bottom:24px;right:24px;z-index:700;background:var(--surface2);border:1px solid var(--border2);border-radius:var(--r2);padding:14px 20px;font-size:14px;font-weight:500;transform:translateY(80px);opacity:0;transition:all .3s;max-width:320px;display:flex;align-items:center;gap:10px;pointer-events:none}
.toast.show{transform:translateY(0);opacity:1}
.toast.success{border-color:rgba(34,197,94,.3)}
.toast.error{border-color:rgba(239,68,68,.3)}
.toast.info{border-color:rgba(240,180,41,.3)}
.toast-dot{width:8px;height:8px;border-radius:50%;flex-shrink:0}
.toast.success .toast-dot{background:var(--green)}
.toast.error .toast-dot{background:var(--red)}
.toast.info .toast-dot{background:var(--gold)}

/* ===== ADD ITEM MODALS ===== */
.add-modal-box{background:var(--surface);border:1px solid var(--border2);border-radius:var(--r3);padding:30px;width:min(520px,92vw);max-height:88vh;overflow-y:auto;position:relative}
.add-modal-box h3{font-size:20px;font-weight:900;margin-bottom:20px}

/* SCROLLBAR IN CHAT */
.chat-messages::-webkit-scrollbar{width:3px}

@media(max-width:1100px){.app-shell{grid-template-columns:200px 1fr;}.rpanel{display:none}}
@media(max-width:800px){.app-shell{grid-template-columns:1fr}.sidebar{display:none}.stat-grid{grid-template-columns:repeat(2,1fr)}}
@media(max-width:600px){.land-stats{flex-direction:column}.land-stat{border-right:none;border-bottom:1px solid var(--border)}.land-stat:last-child{border-bottom:none}.vs-grid{grid-template-columns:1fr}}
</style>
</head>
<body>

<!-- ===== NAVIGATION ===== -->
<nav id="main-nav">
  <div class="brand" onclick="goHome()">
    <div class="brand-mark">A</div>
    APEX
  </div>
  <div class="nav-center" id="nav-app-links" style="display:none">
    <button class="nav-icon-btn active" id="ni-feed" onclick="switchTab('feed')">
      <svg viewBox="0 0 24 24"><path d="M3 9l9-7 9 7v11a2 2 0 01-2 2H5a2 2 0 01-2-2z"/><polyline points="9 22 9 12 15 12 15 22"/></svg>
      Feed
    </button>
    <button class="nav-icon-btn" id="ni-jobs" onclick="switchTab('jobs')">
      <svg viewBox="0 0 24 24"><rect x="2" y="7" width="20" height="14" rx="2"/><path d="M16 7V5a2 2 0 00-2-2h-4a2 2 0 00-2 2v2"/></svg>
      Jobs
      <span class="dot" id="jobs-dot"></span>
    </button>
    <button class="nav-icon-btn" id="ni-network" onclick="switchTab('network')">
      <svg viewBox="0 0 24 24"><path d="M17 21v-2a4 4 0 00-4-4H5a4 4 0 00-4 4v2"/><circle cx="9" cy="7" r="4"/><path d="M23 21v-2a4 4 0 00-3-3.87"/><path d="M16 3.13a4 4 0 010 7.75"/></svg>
      Network
    </button>
    <button class="nav-icon-btn" id="ni-messages" onclick="switchTab('messages')">
      <svg viewBox="0 0 24 24"><path d="M21 15a2 2 0 01-2 2H7l-4 4V5a2 2 0 012-2h14a2 2 0 012 2z"/></svg>
      Messages
      <span class="dot" id="msg-dot"></span>
    </button>
    <button class="nav-icon-btn" id="ni-notifications" onclick="switchTab('notifications')">
      <svg viewBox="0 0 24 24"><path d="M18 8A6 6 0 006 8c0 7-3 9-3 9h18s-3-2-3-9"/><path d="M13.73 21a2 2 0 01-3.46 0"/></svg>
      Alerts
      <span class="dot" id="notif-dot"></span>
    </button>
  </div>
  <div class="nav-right">
    <div class="nav-search" id="nav-search-bar" style="display:none">
      <svg viewBox="0 0 24 24"><circle cx="11" cy="11" r="8"/><path d="m21 21-4.35-4.35"/></svg>
      <input type="text" placeholder="Search APEX..." oninput="globalSearch(this.value)">
    </div>
    <div id="nav-guest-btns">
      <div style="display:flex;gap:8px">
        <button class="btn-ghost" onclick="openModal('auth','login')">Sign in</button>
        <button class="btn-gold" onclick="openModal('auth','signup')">Get started</button>
      </div>
    </div>
    <div id="nav-user-btns" style="display:none">
      <div style="display:flex;align-items:center;gap:10px">
        <button class="btn-gold" style="font-size:12px;padding:6px 14px" onclick="switchTab('jobs');startMassApply()">⚡ Mass Apply</button>
        <div class="avatar-sm" id="nav-av" onclick="switchTab('profile')">MS</div>
      </div>
    </div>
  </div>
</nav>

<!-- ===== LANDING PAGE ===== -->
<div id="pg-land" class="page active">
  <div class="land-hero">
    <div class="eyebrow">★ The LinkedIn Killer Has Arrived</div>
    <h1 class="land-h1">Your career,<br><span class="accent">supercharged</span></h1>
    <p class="land-p">APEX combines the best of LinkedIn with AI-powered job matching, one-click mass applying, and every career tool you actually need — none of the noise you don't.</p>
    <div class="land-cta">
      <button class="cta-main" onclick="openModal('auth','signup')">Start free — takes 2 minutes</button>
      <button class="cta-outline" onclick="openModal('auth','login')">Already have an account →</button>
    </div>
  </div>
  <div class="land-stats">
    <div class="land-stat"><div class="land-stat-n">2.4M+</div><div class="land-stat-l">Jobs listed</div></div>
    <div class="land-stat"><div class="land-stat-n">1.2M</div><div class="land-stat-l">Applications sent</div></div>
    <div class="land-stat"><div class="land-stat-n">94%</div><div class="land-stat-l">Match accuracy</div></div>
    <div class="land-stat"><div class="land-stat-n">3.8x</div><div class="land-stat-l">More interviews</div></div>
    <div class="land-stat"><div class="land-stat-n">48hr</div><div class="land-stat-l">Avg. first response</div></div>
  </div>
  <div class="land-features">
    <div class="section-eyebrow">Why APEX beats LinkedIn</div>
    <div class="section-h">Every feature you need.<br>Zero features you hate.</div>
    <div class="feat-grid">
      <div class="feat-card"><div class="feat-icon">⚡</div><h3>Mass Auto-Apply</h3><p>Apply to 100+ matching jobs simultaneously. APEX tailors each application using AI — no copy-paste.</p></div>
      <div class="feat-card"><div class="feat-icon">🎯</div><h3>AI Job Matching</h3><p>98% match accuracy using your resume, skills, salary, and preferences. No spray-and-pray.</p></div>
      <div class="feat-card"><div class="feat-icon">📄</div><h3>ATS Resume Optimizer</h3><p>Your resume auto-tailors per application. Beat the bots and get your resume to a human.</p></div>
      <div class="feat-card"><div class="feat-icon">🗺️</div><h3>National Job Coverage</h3><p>All 50 states, remote, hybrid — aggregated from 300+ sources updated every 4 hours.</p></div>
      <div class="feat-card"><div class="feat-icon">📊</div><h3>Salary Intelligence</h3><p>See real salary data for every role, company, and location. Know your market value before you negotiate.</p></div>
      <div class="feat-card"><div class="feat-icon">🎙️</div><h3>Interview Prep AI</h3><p>Role-specific questions, answer frameworks, and live mock interviews powered by AI.</p></div>
      <div class="feat-card"><div class="feat-icon">🔒</div><h3>Ghost Mode</h3><p>Apply invisibly. Your current employer will never see your job search activity. Ever.</p></div>
      <div class="feat-card"><div class="feat-icon">🤝</div><h3>Real Networking</h3><p>Connect with recruiters who actually respond. No InMail credits. No paywalls.</p></div>
      <div class="feat-card"><div class="feat-icon">📈</div><h3>Application Analytics</h3><p>Track every application with status updates, response rates, and actionable next steps.</p></div>
    </div>
  </div>
  <div class="vs-section">
    <div class="section-eyebrow">Comparison</div>
    <div class="section-h">APEX vs LinkedIn</div>
    <div class="vs-grid">
      <div class="vs-col"><div class="vs-label li">😐 LinkedIn</div>
        <div class="vs-item"><span class="vs-check">❌</span>Mass apply requires premium ($40/mo)</div>
        <div class="vs-item"><span class="vs-check">❌</span>InMail credits gated behind paywall</div>
        <div class="vs-item"><span class="vs-check">❌</span>No ATS resume optimization</div>
        <div class="vs-item"><span class="vs-check">❌</span>Recruiter spam with no context</div>
        <div class="vs-item"><span class="vs-check">❌</span>Salary data is rough estimates</div>
        <div class="vs-item"><span class="vs-check">❌</span>No interview prep integration</div>
        <div class="vs-item"><span class="vs-check">❌</span>Your boss can see you're job hunting</div>
        <div class="vs-item"><span class="vs-check">❌</span>Generic job recommendations</div>
      </div>
      <div class="vs-col apex-col"><div class="vs-label ap">⚡ APEX — Free</div>
        <div class="vs-item"><span class="vs-check">✅</span>Mass apply to 100+ jobs free</div>
        <div class="vs-item"><span class="vs-check">✅</span>Unlimited recruiter messages</div>
        <div class="vs-item"><span class="vs-check">✅</span>AI ATS optimizer built in</div>
        <div class="vs-item"><span class="vs-check">✅</span>Matched recruiters only</div>
        <div class="vs-item"><span class="vs-check">✅</span>Real-time verified salary data</div>
        <div class="vs-item"><span class="vs-check">✅</span>Full interview prep suite</div>
        <div class="vs-item"><span class="vs-check">✅</span>Ghost Mode — 100% private</div>
        <div class="vs-item"><span class="vs-check">✅</span>98% AI match accuracy</div>
      </div>
    </div>
  </div>
</div>

<!-- ===== AUTH MODAL ===== -->
<div class="overlay" id="auth-overlay" onclick="closeOverlayOutside(event,'auth-overlay')">
  <div class="modal-box">
    <button class="modal-close" onclick="closeModal('auth-overlay')">✕</button>
    <div id="login-panel">
      <h2>Welcome back</h2>
      <p class="sub">Sign in to your APEX account</p>
      <div class="field"><label>Email</label><input type="email" id="li-email" placeholder="you@email.com"></div>
      <div class="field"><label>Password</label><input type="password" id="li-pw" placeholder="••••••••"></div>
      <button class="btn-block" onclick="doLogin()">Sign in</button>
      <div class="switch-link">New to APEX? <span onclick="switchAuth('signup')">Create free account</span></div>
    </div>
    <div id="signup-panel" style="display:none">
      <h2>Join APEX</h2>
      <p class="sub">Free forever. No credit card required.</p>
      <div class="field-row">
        <div class="field"><label>First name</label><input type="text" id="su-first" placeholder="Alex"></div>
        <div class="field"><label>Last name</label><input type="text" id="su-last" placeholder="Johnson"></div>
      </div>
      <div class="field"><label>Email</label><input type="email" id="su-email" placeholder="you@email.com"></div>
      <div class="field"><label>Password</label><input type="password" id="su-pw" placeholder="Min 6 characters"></div>
      <button class="btn-block" onclick="doSignup()">Create free account →</button>
      <div class="switch-link">Already a member? <span onclick="switchAuth('login')">Sign in</span></div>
    </div>
  </div>
</div>

<!-- ===== ONBOARDING ===== -->
<div id="pg-onboard" class="page">
  <div class="onboard-wrap">
    <div class="steps-bar" id="steps-bar"></div>
    <div class="ob-step active" id="ob1">
      <div class="ob-h">What's your career field?</div>
      <div class="ob-sub">We'll use this to surface the most relevant jobs, connections, and industry news for you.</div>
      <div class="opt-card" onclick="pickOpt('field','Cybersecurity / IT Security',this)"><span class="opt-icon">🔐</span><div><div class="opt-main">Cybersecurity / IT Security</div><div class="opt-sub">Analyst, Penetration Tester, SOC, GRC</div></div></div>
      <div class="opt-card" onclick="pickOpt('field','Networking / Infrastructure',this)"><span class="opt-icon">🌐</span><div><div class="opt-main">Networking / Infrastructure</div><div class="opt-sub">Network Engineer, SysAdmin, Cloud Infra</div></div></div>
      <div class="opt-card" onclick="pickOpt('field','Software Engineering',this)"><span class="opt-icon">💻</span><div><div class="opt-main">Software Engineering</div><div class="opt-sub">Frontend, Backend, Full Stack, DevOps</div></div></div>
      <div class="opt-card" onclick="pickOpt('field','Data & AI',this)"><span class="opt-icon">🤖</span><div><div class="opt-main">Data & AI / Machine Learning</div><div class="opt-sub">Data Scientist, ML Engineer, Analyst</div></div></div>
      <div class="opt-card" onclick="pickOpt('field','Business & Operations',this)"><span class="opt-icon">💼</span><div><div class="opt-main">Business & Operations</div><div class="opt-sub">Project Manager, Client Relations, Strategy</div></div></div>
      <div class="opt-card" onclick="pickOpt('field','Design & Creative',this)"><span class="opt-icon">🎨</span><div><div class="opt-main">Design & Creative</div><div class="opt-sub">UX/UI, Product Design, Marketing</div></div></div>
      <button class="btn-next" onclick="obNext(1)">Continue →</button>
    </div>
    <div class="ob-step" id="ob2">
      <div class="ob-h">Experience level?</div>
      <div class="ob-sub">This determines seniority filters and helps us skip roles you're over or under-qualified for.</div>
      <div class="opt-card" onclick="pickOpt('exp','Internship / Entry-level (0–2 yrs)',this)"><span class="opt-icon">🌱</span><div><div class="opt-main">Internship / Entry-level</div><div class="opt-sub">0–2 years experience</div></div></div>
      <div class="opt-card" onclick="pickOpt('exp','Mid-level (2–5 yrs)',this)"><span class="opt-icon">🚀</span><div><div class="opt-main">Mid-level</div><div class="opt-sub">2–5 years, some ownership</div></div></div>
      <div class="opt-card" onclick="pickOpt('exp','Senior (5–10 yrs)',this)"><span class="opt-icon">⭐</span><div><div class="opt-main">Senior</div><div class="opt-sub">5–10 years, leads projects</div></div></div>
      <div class="opt-card" onclick="pickOpt('exp','Director / Executive (10+ yrs)',this)"><span class="opt-icon">🏆</span><div><div class="opt-main">Director / Executive</div><div class="opt-sub">10+ years, manages teams or departments</div></div></div>
      <button class="btn-next" onclick="obNext(2)">Continue →</button>
      <button class="btn-back" onclick="obBack(2)">← Back</button>
    </div>
    <div class="ob-step" id="ob3">
      <div class="ob-h">Work style preferences?</div>
      <div class="ob-sub">Select everything that fits — we'll build your ideal job feed around your preferences.</div>
      <div class="multi-grid" id="work-pref-grid">
        <div class="multi-card" onclick="toggleMulti(this,'workstyle')"><div class="mi">🏠</div><div class="ml">Remote</div></div>
        <div class="multi-card" onclick="toggleMulti(this,'workstyle')"><div class="mi">🔀</div><div class="ml">Hybrid</div></div>
        <div class="multi-card" onclick="toggleMulti(this,'workstyle')"><div class="mi">🏢</div><div class="ml">On-site</div></div>
        <div class="multi-card" onclick="toggleMulti(this,'workstyle')"><div class="mi">⏰</div><div class="ml">Full-time</div></div>
        <div class="multi-card" onclick="toggleMulti(this,'workstyle')"><div class="mi">🕐</div><div class="ml">Part-time</div></div>
        <div class="multi-card" onclick="toggleMulti(this,'workstyle')"><div class="mi">📝</div><div class="ml">Contract</div></div>
        <div class="multi-card" onclick="toggleMulti(this,'workstyle')"><div class="mi">🎓</div><div class="ml">Internship</div></div>
        <div class="multi-card" onclick="toggleMulti(this,'workstyle')"><div class="mi">✈️</div><div class="ml">Relocate</div></div>
      </div>
      <div class="field" style="margin-top:20px"><label>Preferred locations (cities, states, "Remote")</label><input type="text" id="pref-loc" placeholder="e.g. Orlando FL, Austin TX, Remote, US-wide"></div>
      <button class="btn-next" onclick="obNext(3)">Continue →</button>
      <button class="btn-back" onclick="obBack(3)">← Back</button>
    </div>
    <div class="ob-step" id="ob4">
      <div class="ob-h">Salary expectations?</div>
      <div class="ob-sub">We'll filter out roles below your minimum and highlight ones in your sweet spot.</div>
      <div class="field"><label>Minimum acceptable ($/year)</label>
        <div class="sal-row" style="margin-top:8px"><input type="range" min="30000" max="300000" step="5000" value="55000" id="min-sal" oninput="updSal('min-sal','min-sal-v')"><div class="sal-val" id="min-sal-v">$55,000</div></div>
      </div>
      <div class="field" style="margin-top:20px"><label>Target salary ($/year)</label>
        <div class="sal-row" style="margin-top:8px"><input type="range" min="30000" max="300000" step="5000" value="85000" id="tgt-sal" oninput="updSal('tgt-sal','tgt-sal-v')"><div class="sal-val" id="tgt-sal-v">$85,000</div></div>
      </div>
      <div class="field" style="margin-top:20px"><label>Key skills (comma-separated)</label><input type="text" id="skills-inp" value="Cybersecurity, Network+, Python, Linux, SIEM, Wireshark"></div>
      <button class="btn-next" onclick="obNext(4)">Continue →</button>
      <button class="btn-back" onclick="obBack(4)">← Back</button>
    </div>
    <div class="ob-step" id="ob5">
      <div class="ob-h">What type of roles?</div>
      <div class="ob-sub">Choose all the job types you're open to — APEX will show them all.</div>
      <div class="multi-grid">
        <div class="multi-card" onclick="toggleMulti(this,'jobtype')"><div class="mi">🔐</div><div class="ml">Security Analyst</div></div>
        <div class="multi-card" onclick="toggleMulti(this,'jobtype')"><div class="mi">🛡️</div><div class="ml">SOC Analyst</div></div>
        <div class="multi-card" onclick="toggleMulti(this,'jobtype')"><div class="mi">🌐</div><div class="ml">Network Eng.</div></div>
        <div class="multi-card" onclick="toggleMulti(this,'jobtype')"><div class="mi">🔍</div><div class="ml">Pen Tester</div></div>
        <div class="multi-card" onclick="toggleMulti(this,'jobtype')"><div class="mi">☁️</div><div class="ml">Cloud Security</div></div>
        <div class="multi-card" onclick="toggleMulti(this,'jobtype')"><div class="mi">📋</div><div class="ml">GRC/Compliance</div></div>
        <div class="multi-card" onclick="toggleMulti(this,'jobtype')"><div class="mi">💻</div><div class="ml">IT Support</div></div>
        <div class="multi-card" onclick="toggleMulti(this,'jobtype')"><div class="mi">🔧</div><div class="ml">SysAdmin</div></div>
      </div>
      <button class="btn-next" onclick="obNext(5)">Continue →</button>
      <button class="btn-back" onclick="obBack(5)">← Back</button>
    </div>
    <div class="ob-step" id="ob6">
      <div class="ob-h">Upload your resume</div>
      <div class="ob-sub">APEX uses your resume to auto-fill applications and optimize it per role using AI. Your data is encrypted and never shared.</div>
      <div class="upload-zone" id="resume-zone" onclick="document.getElementById('res-inp').click()">
        <div class="upload-icon">📄</div>
        <h4>Drop your resume here</h4>
        <p>PDF, DOCX, or TXT — max 10MB</p>
        <div class="upload-fname" id="res-fname" style="display:none"></div>
      </div>
      <input type="file" id="res-inp" accept=".pdf,.docx,.txt" style="display:none" onchange="handleResume(event)">
      <p style="text-align:center;margin-top:12px;font-size:13px;color:var(--text3)">Or <span style="color:var(--gold);cursor:pointer;font-weight:600" onclick="obNext(6)">skip for now</span></p>
      <button class="btn-next" onclick="obNext(6)" style="margin-top:14px">Finish setup →</button>
      <button class="btn-back" onclick="obBack(6)">← Back</button>
    </div>
  </div>
</div>

<!-- ===== MAIN APP ===== -->
<div id="pg-app" class="page">
  <div class="app-shell">
    <!-- SIDEBAR -->
    <div class="sidebar">
      <div class="sb-label">Main</div>
      <div class="sb-link active" id="sl-feed" onclick="switchTab('feed')">
        <svg viewBox="0 0 24 24"><path d="M3 9l9-7 9 7v11a2 2 0 01-2 2H5a2 2 0 01-2-2z"/><polyline points="9 22 9 12 15 12 15 22"/></svg> Feed
      </div>
      <div class="sb-link" id="sl-jobs" onclick="switchTab('jobs')">
        <svg viewBox="0 0 24 24"><rect x="2" y="7" width="20" height="14" rx="2"/><path d="M16 7V5a2 2 0 00-2-2h-4a2 2 0 00-2 2v2"/></svg> Find Jobs
        <span class="sb-badge" id="jobs-badge">248</span>
      </div>
      <div class="sb-link" id="sl-dashboard" onclick="switchTab('dashboard')">
        <svg viewBox="0 0 24 24"><rect x="3" y="3" width="7" height="7"/><rect x="14" y="3" width="7" height="7"/><rect x="3" y="14" width="7" height="7"/><rect x="14" y="14" width="7" height="7"/></svg> Dashboard
      </div>
      <div class="sb-link" id="sl-applications" onclick="switchTab('applications')">
        <svg viewBox="0 0 24 24"><path d="M14 2H6a2 2 0 00-2 2v16a2 2 0 002 2h12a2 2 0 002-2V8z"/><polyline points="14 2 14 8 20 8"/></svg> Applications
        <span class="sb-badge" id="app-badge" style="display:none">0</span>
      </div>
      <div class="sb-link" id="sl-saved" onclick="switchTab('saved')">
        <svg viewBox="0 0 24 24"><path d="M19 21l-7-5-7 5V5a2 2 0 012-2h10a2 2 0 012 2z"/></svg> Saved Jobs
      </div>
      <div class="sb-label" style="margin-top:8px">Profile</div>
      <div class="sb-link" id="sl-profile" onclick="switchTab('profile')">
        <svg viewBox="0 0 24 24"><path d="M20 21v-2a4 4 0 00-4-4H8a4 4 0 00-4 4v2"/><circle cx="12" cy="7" r="4"/></svg> My Profile
      </div>
      <div class="sb-link" id="sl-network" onclick="switchTab('network')">
        <svg viewBox="0 0 24 24"><path d="M17 21v-2a4 4 0 00-4-4H5a4 4 0 00-4 4v2"/><circle cx="9" cy="7" r="4"/><path d="M23 21v-2a4 4 0 00-3-3.87"/><path d="M16 3.13a4 4 0 010 7.75"/></svg> Network
      </div>
      <div class="sb-link" id="sl-messages" onclick="switchTab('messages')">
        <svg viewBox="0 0 24 24"><path d="M21 15a2 2 0 01-2 2H7l-4 4V5a2 2 0 012-2h14a2 2 0 012 2z"/></svg> Messages
      </div>
      <div class="sb-label" style="margin-top:8px">Tools</div>
      <div class="sb-link" id="sl-resume" onclick="switchTab('resume')">
        <svg viewBox="0 0 24 24"><path d="M14 2H6a2 2 0 00-2 2v16a2 2 0 002 2h12a2 2 0 002-2V8z"/><polyline points="14 2 14 8 20 8"/><line x1="16" y1="13" x2="8" y2="13"/><line x1="16" y1="17" x2="8" y2="17"/></svg> Resume
      </div>
      <div class="sb-link" id="sl-salary" onclick="switchTab('salary')">
        <svg viewBox="0 0 24 24"><line x1="12" y1="1" x2="12" y2="23"/><path d="M17 5H9.5a3.5 3.5 0 000 7h5a3.5 3.5 0 010 7H6"/></svg> Salary Insights
      </div>
      <div class="sb-link" id="sl-interview" onclick="switchTab('interview')">
        <svg viewBox="0 0 24 24"><path d="M21 15a2 2 0 01-2 2H7l-4 4V5a2 2 0 012-2h14a2 2 0 012 2z"/></svg> Interview Prep
      </div>
      <div class="sb-link" id="sl-notifications" onclick="switchTab('notifications')">
        <svg viewBox="0 0 24 24"><path d="M18 8A6 6 0 006 8c0 7-3 9-3 9h18s-3-2-3-9"/><path d="M13.73 21a2 2 0 01-3.46 0"/></svg> Notifications
        <span class="sb-badge">4</span>
      </div>
      <div style="margin-top:8px">
        <div class="sb-pro-card">
          <h4>⚡ APEX Pro</h4>
          <p>Unlimited mass apply, AI cover letters & priority recruiter matching</p>
          <div class="sb-pro-btn">Upgrade — $9/mo</div>
        </div>
      </div>
      <div class="sb-link" style="margin-top:8px;color:var(--red)" onclick="doLogout()">
        <svg viewBox="0 0 24 24"><path d="M9 21H5a2 2 0 01-2-2V5a2 2 0 012-2h4"/><polyline points="16 17 21 12 16 7"/><line x1="21" y1="12" x2="9" y2="12"/></svg> Sign out
      </div>
    </div>

    <!-- MAIN CONTENT -->
    <div class="main" id="main-content">

      <!-- FEED TAB -->
      <div id="tab-feed">
        <div class="feed-composer">
          <div class="composer-row">
            <div class="avatar-sm" id="comp-av" style="width:40px;height:40px;font-size:14px">MS</div>
            <input class="composer-input" placeholder="Share an update, achievement, or insight..." onclick="openModal('post-composer',null)" readonly>
          </div>
          <div class="composer-actions">
            <button class="comp-act" onclick="openModal('post-composer',null)"><svg viewBox="0 0 24 24"><rect x="3" y="3" width="18" height="18" rx="2"/><circle cx="8.5" cy="8.5" r="1.5"/><polyline points="21 15 16 10 5 21"/></svg> Photo</button>
            <button class="comp-act" onclick="openModal('post-composer',null)"><svg viewBox="0 0 24 24"><polygon points="23 7 16 12 23 17 23 7"/><rect x="1" y="5" width="15" height="14" rx="2"/></svg> Video</button>
            <button class="comp-act" onclick="openModal('post-composer',null)"><svg viewBox="0 0 24 24"><path d="M14 2H6a2 2 0 00-2 2v16a2 2 0 002 2h12a2 2 0 002-2V8z"/><polyline points="14 2 14 8 20 8"/></svg> Article</button>
            <button class="comp-act" onclick="openModal('post-composer',null)"><svg viewBox="0 0 24 24"><circle cx="12" cy="12" r="10"/><line x1="12" y1="8" x2="12" y2="16"/><line x1="8" y1="12" x2="16" y2="12"/></svg> Project</button>
          </div>
        </div>
        <div id="feed-posts"></div>
      </div>

      <!-- DASHBOARD TAB -->
      <div id="tab-dashboard" style="display:none">
        <div class="dash-greeting">
          <h2 id="dash-hi">Good morning, Mohmmad 👋</h2>
          <p>You have <span id="dash-matches" style="color:var(--gold);font-weight:700">248 new matches</span> ready to review.</p>
        </div>
        <div class="mass-bar">
          <div><h3>⚡ Ready to mass-apply?</h3><p id="mass-bar-sub">127 jobs match your profile with 80%+ AI compatibility score</p></div>
          <button class="btn-mass" onclick="startMassApply()">Auto-apply to all matches</button>
        </div>
        <div class="stat-grid">
          <div class="stat-card"><div class="n" id="s-applied" style="color:var(--gold)">0</div><div class="l">Applied</div></div>
          <div class="stat-card"><div class="n" style="color:var(--text)">248</div><div class="l">Matches</div></div>
          <div class="stat-card"><div class="n" id="s-interviews" style="color:var(--green)">0</div><div class="l">Interviews</div></div>
          <div class="stat-card"><div class="n" id="s-saved" style="color:var(--blue)">0</div><div class="l">Saved</div></div>
        </div>
        <h3 style="font-size:16px;font-weight:800;margin-bottom:14px;font-family:var(--font-head)">Top job matches</h3>
        <div id="dash-jobs"></div>
      </div>

      <!-- JOBS TAB -->
      <div id="tab-jobs" style="display:none">
        <div class="jobs-header">
          <div class="search-row"><input type="text" id="job-q" placeholder="Job title, skill, or company..." oninput="renderJobs()"></div>
          <button class="btn-ghost" onclick="toast('Advanced filters — coming soon!','info')">Filters ▾</button>
        </div>
        <div class="filter-row">
          <div class="chip active" onclick="setFilter('all',this)">All Jobs</div>
          <div class="chip" onclick="setFilter('cyber',this)">Cybersecurity</div>
          <div class="chip" onclick="setFilter('network',this)">Networking</div>
          <div class="chip" onclick="setFilter('remote',this)">Remote</div>
          <div class="chip" onclick="setFilter('entry',this)">Entry-level</div>
          <div class="chip" onclick="setFilter('intern',this)">Internship</div>
          <div class="chip" onclick="setFilter('cloud',this)">Cloud</div>
        </div>
        <div class="mass-bar" style="margin-bottom:16px">
          <div><h3>⚡ Mass apply</h3><p id="mass-job-count">Select jobs or apply to all 80%+ matches at once</p></div>
          <button class="btn-mass" onclick="startMassApply()">Auto-apply to matches</button>
        </div>
        <div id="jobs-list"></div>
      </div>

      <!-- APPLICATIONS TAB -->
      <div id="tab-applications" style="display:none">
        <h2 style="font-size:22px;font-weight:900;margin-bottom:16px;font-family:var(--font-head)">My Applications</h2>
        <div class="filter-row">
          <div class="chip active">All</div>
          <div class="chip">Pending</div>
          <div class="chip">Viewed</div>
          <div class="chip">Interview</div>
          <div class="chip">Offer</div>
          <div class="chip">Rejected</div>
        </div>
        <div id="applications-list"></div>
      </div>

      <!-- SAVED TAB -->
      <div id="tab-saved" style="display:none">
        <h2 style="font-size:22px;font-weight:900;margin-bottom:16px;font-family:var(--font-head)">Saved Jobs</h2>
        <div id="saved-list"></div>
      </div>

      <!-- PROFILE TAB -->
      <div id="tab-profile" style="display:none">
        <div class="profile-banner">
          <div class="profile-banner-bg"></div>
          <div class="profile-banner-inner">
            <div class="profile-av" id="prof-av">MS</div>
            <div class="name" id="prof-name">Mohmmad Shaikh</div>
            <div class="headline" id="prof-headline">Cybersecurity & IT Student · Seminole State College</div>
            <div class="location">📍 Sanford, FL · Open to relocation US-wide</div>
            <div class="open-to-work">🟢 Open to work · Internship & Entry-level</div>
            <div class="profile-meta">
              <a href="#">🔗 ccmohmmadshaikh.github.io</a>
              <a href="#">💼 linkedin.com/in/mohmmadshaikh</a>
              <a href="#">📧 Contact</a>
            </div>
            <div class="profile-cta-row">
              <button class="btn-connect" onclick="toast('Connect request sent!','success')">+ Connect</button>
              <button class="btn-edit" onclick="toast('Profile editor coming soon!','info')">Edit profile</button>
              <button class="btn-edit" onclick="toast('Share link copied!','success')">Share profile</button>
            </div>
          </div>
        </div>

        <!-- ABOUT -->
        <div class="p-section">
          <div class="p-section-header"><h3>About</h3><button class="p-add-btn" onclick="toast('Edit mode coming soon!','info')">✎</button></div>
          <p style="font-size:14px;color:var(--text2);line-height:1.7" id="about-text">Final-semester Information Technology & Cybersecurity student at Seminole State College, actively seeking internship and entry-level roles in cybersecurity and networking across the United States. Multilingual (English, Urdu, Hindi). Prior client-facing experience at Morgan and Morgan in client relations and case consulting. Built full-stack projects including a cybersecurity dashboard (NETWATCH/PRO), a personal portfolio, and a multiplayer browser game — all hosted on GitHub Pages. Passionate about defensive security, network monitoring, and making systems resilient against threats.</p>
        </div>

        <!-- EXPERIENCE -->
        <div class="p-section" id="exp-section">
          <div class="p-section-header"><h3>Experience</h3><button class="p-add-btn" onclick="openModal('add-exp',null)">+</button></div>
          <div id="exp-list"></div>
        </div>

        <!-- EDUCATION -->
        <div class="p-section" id="edu-section">
          <div class="p-section-header"><h3>Education</h3><button class="p-add-btn" onclick="openModal('add-edu',null)">+</button></div>
          <div id="edu-list"></div>
        </div>

        <!-- PROJECTS -->
        <div class="p-section" id="proj-section">
          <div class="p-section-header"><h3>Projects</h3><button class="p-add-btn" onclick="openModal('add-proj',null)">+</button></div>
          <div id="proj-list"></div>
        </div>

        <!-- SKILLS -->
        <div class="p-section">
          <div class="p-section-header"><h3>Skills & Endorsements</h3><button class="p-add-btn" onclick="openModal('add-skill',null)">+</button></div>
          <div class="skill-section" id="skills-list"></div>
        </div>

        <!-- CERTIFICATIONS -->
        <div class="p-section">
          <div class="p-section-header"><h3>Certifications & Licenses</h3><button class="p-add-btn" onclick="openModal('add-cert',null)">+</button></div>
          <div id="certs-list"></div>
        </div>

        <!-- LANGUAGES -->
        <div class="p-section">
          <div class="p-section-header"><h3>Languages</h3><button class="p-add-btn" onclick="toast('Language editor coming soon!','info')">+</button></div>
          <div id="langs-list"></div>
        </div>

        <!-- VOLUNTEER -->
        <div class="p-section">
          <div class="p-section-header"><h3>Volunteer & Community</h3><button class="p-add-btn" onclick="toast('Add volunteer experience coming soon!','info')">+</button></div>
          <div id="vol-list"></div>
        </div>

        <!-- RECOMMENDATIONS -->
        <div class="p-section">
          <div class="p-section-header"><h3>Recommendations</h3><button class="p-add-btn" onclick="toast('Request a recommendation coming soon!','info')">+</button></div>
          <div id="reco-list"></div>
        </div>

        <!-- HONORS & AWARDS -->
        <div class="p-section">
          <div class="p-section-header"><h3>Honors & Awards</h3><button class="p-add-btn" onclick="toast('Add an award coming soon!','info')">+</button></div>
          <div id="awards-list"></div>
        </div>

        <!-- PUBLICATIONS -->
        <div class="p-section">
          <div class="p-section-header"><h3>Publications & Articles</h3><button class="p-add-btn" onclick="toast('Add a publication coming soon!','info')">+</button></div>
          <p style="font-size:13px;color:var(--text3)">No publications yet. Share research, blog posts, or articles you've written.</p>
        </div>

        <!-- COURSES -->
        <div class="p-section">
          <div class="p-section-header"><h3>Courses & Training</h3><button class="p-add-btn" onclick="toast('Add a course coming soon!','info')">+</button></div>
          <div id="courses-list"></div>
        </div>
      </div>

      <!-- NETWORK TAB -->
      <div id="tab-network" style="display:none">
        <h2 style="font-size:22px;font-weight:900;margin-bottom:6px;font-family:var(--font-head)">My Network</h2>
        <p style="font-size:14px;color:var(--text3);margin-bottom:20px">People you may know from your field and location</p>
        <div class="network-grid" id="network-grid"></div>
      </div>

      <!-- MESSAGES TAB -->
      <div id="tab-messages" style="display:none">
        <div class="msg-layout">
          <div class="msg-list">
            <div class="msg-list-header">Messages</div>
            <div id="msg-list-inner"></div>
          </div>
          <div class="chat-area">
            <div class="chat-header" id="chat-header">
              <div class="avatar-sm" id="chat-av" style="width:36px;height:36px;font-size:12px">?</div>
              <div><div class="name" id="chat-name">Select a conversation</div><div class="status">●  Online</div></div>
            </div>
            <div class="chat-messages" id="chat-msgs"></div>
            <div class="chat-input-row">
              <input class="chat-input" id="chat-inp" placeholder="Write a message..." onkeydown="if(event.key==='Enter')sendMsg()">
              <button class="btn-send" onclick="sendMsg()">Send</button>
            </div>
          </div>
        </div>
      </div>

      <!-- RESUME TAB -->
      <div id="tab-resume" style="display:none">
        <h2 style="font-size:22px;font-weight:900;margin-bottom:6px;font-family:var(--font-head)">Resume Management</h2>
        <p style="font-size:14px;color:var(--text3);margin-bottom:20px">Upload, manage, and AI-optimize your resume for every application.</p>
        <div class="p-section">
          <div class="p-section-header"><h3>Your Resume</h3></div>
          <div class="upload-zone" id="app-res-zone" onclick="document.getElementById('app-res-inp').click()">
            <div class="upload-icon">📄</div>
            <h4 id="app-res-title">Upload your resume</h4>
            <p id="app-res-sub">PDF, DOCX, or TXT — max 10MB</p>
            <div class="upload-fname" id="app-res-fname" style="display:none"></div>
          </div>
          <input type="file" id="app-res-inp" accept=".pdf,.docx,.txt" style="display:none" onchange="handleAppResume(event)">
        </div>
        <div class="p-section">
          <h3 style="font-size:17px;font-weight:800;margin-bottom:16px;font-family:var(--font-head)">AI Resume Settings</h3>
          <div id="resume-settings"></div>
        </div>
        <div class="p-section">
          <h3 style="font-size:17px;font-weight:800;margin-bottom:16px;font-family:var(--font-head)">ATS Score</h3>
          <div style="display:flex;align-items:center;gap:20px">
            <div style="position:relative;width:90px;height:90px">
              <svg width="90" height="90" viewBox="0 0 90 90" style="transform:rotate(-90deg)">
                <circle cx="45" cy="45" r="36" fill="none" stroke="var(--border2)" stroke-width="7"/>
                <circle cx="45" cy="45" r="36" fill="none" stroke="var(--gold)" stroke-width="7" stroke-linecap="round" stroke-dasharray="226" stroke-dashoffset="50"/>
              </svg>
              <div style="position:absolute;inset:0;display:flex;flex-direction:column;align-items:center;justify-content:center">
                <div style="font-size:20px;font-weight:900;font-family:var(--font-head);color:var(--gold)">78</div>
                <div style="font-size:10px;color:var(--text3)">/ 100</div>
              </div>
            </div>
            <div>
              <div style="font-size:16px;font-weight:700;margin-bottom:4px">Good — can be improved</div>
              <div style="font-size:13px;color:var(--text3);line-height:1.5">Add more quantified achievements and targeted keywords to reach 90+. <span style="color:var(--gold);cursor:pointer;font-weight:600" onclick="toast('AI optimization running...','info')">Optimize with AI →</span></div>
            </div>
          </div>
        </div>
      </div>

      <!-- SALARY INSIGHTS TAB -->
      <div id="tab-salary" style="display:none">
        <h2 style="font-size:22px;font-weight:900;margin-bottom:6px;font-family:var(--font-head)">Salary Insights</h2>
        <p style="font-size:14px;color:var(--text3);margin-bottom:20px">Real market data for cybersecurity and networking roles across the US.</p>
        <div class="p-section">
          <h3 style="font-size:17px;font-weight:800;margin-bottom:4px;font-family:var(--font-head)">Cybersecurity Analyst — Market Data</h3>
          <p style="font-size:13px;color:var(--text3);margin-bottom:16px">Based on 12,400+ verified salaries · Updated April 2025</p>
          <div class="salary-chart-wrap">
            <div style="display:flex;justify-content:space-between;font-size:12px;color:var(--text3)">
              <span>Salary range by experience</span><span style="color:var(--gold);font-weight:700">Median: $82,000</span>
            </div>
            <div class="sal-bars">
              <div class="sal-bar-col"><div class="sal-bar" style="height:40%;background:var(--border2)"></div><div class="sal-bar-label">Intern</div><div class="sal-bar-val" style="font-size:10px;color:var(--text3)">$52K</div></div>
              <div class="sal-bar-col"><div class="sal-bar highlighted" style="height:65%"></div><div class="sal-bar-label">Entry</div><div class="sal-bar-val" style="color:var(--gold);font-size:10px">$68K</div></div>
              <div class="sal-bar-col"><div class="sal-bar" style="height:80%"></div><div class="sal-bar-label">Mid</div><div class="sal-bar-val" style="font-size:10px;color:var(--text3)">$90K</div></div>
              <div class="sal-bar-col"><div class="sal-bar" style="height:95%"></div><div class="sal-bar-label">Senior</div><div class="sal-bar-val" style="font-size:10px;color:var(--text3)">$125K</div></div>
              <div class="sal-bar-col"><div class="sal-bar" style="height:100%"></div><div class="sal-bar-label">Principal</div><div class="sal-bar-val" style="font-size:10px;color:var(--text3)">$155K</div></div>
            </div>
          </div>
          <div class="market-rating">
            <div class="mr-card"><div class="mr-num" style="color:var(--green)">$68K</div><div class="mr-label">Your target (entry)</div></div>
            <div class="mr-card"><div class="mr-num" style="color:var(--gold)">$82K</div><div class="mr-label">Market median</div></div>
            <div class="mr-card"><div class="mr-num" style="color:var(--purple)">$155K</div><div class="mr-label">Top 10% earners</div></div>
          </div>
        </div>
        <div class="p-section">
          <h3 style="font-size:17px;font-weight:800;margin-bottom:16px;font-family:var(--font-head)">By City — Entry-level Security</h3>
          <div id="salary-by-city"></div>
        </div>
      </div>

      <!-- INTERVIEW PREP TAB -->
      <div id="tab-interview" style="display:none">
        <h2 style="font-size:22px;font-weight:900;margin-bottom:6px;font-family:var(--font-head)">Interview Prep</h2>
        <p style="font-size:14px;color:var(--text3);margin-bottom:20px">Role-specific questions with AI-coached answer frameworks.</p>
        <div class="prep-card">
          <h3>🔐 Cybersecurity Analyst — Common Questions</h3>
          <div id="interview-qs"></div>
        </div>
        <div class="prep-card">
          <h3>🧠 Behavioral Questions (STAR Method)</h3>
          <div id="behavioral-qs"></div>
        </div>
      </div>

      <!-- NOTIFICATIONS TAB -->
      <div id="tab-notifications" style="display:none">
        <h2 style="font-size:22px;font-weight:900;margin-bottom:16px;font-family:var(--font-head)">Notifications</h2>
        <div id="notif-list"></div>
      </div>

    </div><!-- /main -->

    <!-- RIGHT PANEL -->
    <div class="rpanel">
      <div class="rp-card" id="rp-profile-mini" style="display:none">
        <div style="text-align:center;padding-bottom:12px;border-bottom:1px solid var(--border);margin-bottom:12px">
          <div class="avatar-sm" style="width:52px;height:52px;font-size:18px;margin:0 auto 8px" id="rp-av">MS</div>
          <div style="font-size:14px;font-weight:700" id="rp-name">Mohmmad Shaikh</div>
          <div style="font-size:12px;color:var(--text3)" id="rp-role">Cybersecurity Student</div>
        </div>
        <div class="prog-row"><div class="prog-label"><span>Profile complete</span><span>82%</span></div><div class="prog-bar"><div class="prog-fill" style="width:82%"></div></div></div>
        <div style="font-size:12px;color:var(--gold);cursor:pointer;margin-top:8px;text-align:center;font-weight:600" onclick="switchTab('profile')">Complete your profile →</div>
      </div>
      <div class="rp-card">
        <h4>Top matches <a onclick="switchTab('jobs')">See all →</a></h4>
        <div id="rp-matches"></div>
      </div>
      <div class="rp-card">
        <h4>Profile views <a>Last 7 days</a></h4>
        <div class="who-viewed-row"><div class="who-av" style="background:rgba(59,130,246,.15);color:var(--blue)">SR</div><div class="who-info"><div class="name">Sarah R.</div><div class="role">Recruiter at CrowdStrike</div></div></div>
        <div class="who-viewed-row"><div class="who-av" style="background:rgba(167,139,250,.15);color:var(--purple)">JM</div><div class="who-info"><div class="name">James M.</div><div class="role">Hiring Mgr · Booz Allen</div></div></div>
        <div class="who-viewed-row"><div class="who-av" style="background:rgba(34,197,94,.15);color:var(--green)">KL</div><div class="who-info"><div class="name">Krista L.</div><div class="role">HR · IBM Security</div></div></div>
        <div style="font-size:12px;color:var(--gold);margin-top:8px;cursor:pointer;font-weight:600">+ 4 more viewed your profile</div>
      </div>
      <div class="rp-card">
        <h4>Application stats</h4>
        <div style="display:grid;grid-template-columns:1fr 1fr;gap:8px">
          <div style="background:var(--surface2);border-radius:var(--r);padding:12px;text-align:center"><div style="font-size:22px;font-weight:900;font-family:var(--font-head);color:var(--gold)" id="rp-stat-applied">0</div><div style="font-size:11px;color:var(--text3)">Applied</div></div>
          <div style="background:var(--surface2);border-radius:var(--r);padding:12px;text-align:center"><div style="font-size:22px;font-weight:900;font-family:var(--font-head)" id="rp-stat-pending">0</div><div style="font-size:11px;color:var(--text3)">Pending</div></div>
          <div style="background:var(--surface2);border-radius:var(--r);padding:12px;text-align:center"><div style="font-size:22px;font-weight:900;font-family:var(--font-head);color:var(--green)" id="rp-stat-int">0</div><div style="font-size:11px;color:var(--text3)">Interviews</div></div>
          <div style="background:var(--surface2);border-radius:var(--r);padding:12px;text-align:center"><div style="font-size:22px;font-weight:900;font-family:var(--font-head);color:var(--blue)" id="rp-stat-saved">0</div><div style="font-size:11px;color:var(--text3)">Saved</div></div>
        </div>
      </div>
      <div class="rp-card">
        <h4>Cybersecurity News</h4>
        <div id="rp-news"></div>
      </div>
    </div>

  </div>
</div>

<!-- ===== APPLY MODAL ===== -->
<div class="overlay" id="apply-overlay" onclick="closeOverlayOutside(event,'apply-overlay')">
  <div class="apply-modal-box">
    <button class="modal-close" onclick="closeModal('apply-overlay')">✕</button>
    <h2 id="am-title">Job Title</h2>
    <div class="co" id="am-co">Company · Location</div>
    <div class="am-section">
      <h4>Resume</h4>
      <div class="resume-pill">
        <span style="font-size:22px">📄</span>
        <div><div class="fn" id="am-res-name">Resume_Mohmmad_Shaikh.pdf</div><div class="sub">AI-tailored for this role · ATS optimized</div></div>
      </div>
    </div>
    <div class="am-section">
      <h4>AI-generated cover letter</h4>
      <textarea class="cover-ta" id="am-cover" rows="5"></textarea>
    </div>
    <div class="am-section">
      <h4>Screening questions</h4>
      <div class="qs-row" id="am-qs">
        <div class="qs-item"><label>Are you authorized to work in the US?</label><select><option>Yes, I am authorized</option><option>No, I require sponsorship</option></select></div>
        <div class="qs-item"><label>Years of relevant experience?</label><input type="text" placeholder="e.g. Less than 1 year"></div>
        <div class="qs-item"><label>Available start date?</label><input type="text" placeholder="e.g. Immediately / May 2025"></div>
      </div>
    </div>
    <div class="am-section">
      <h4>Additional info</h4>
      <div class="extra-fields">
        <input type="text" placeholder="LinkedIn URL" value="linkedin.com/in/mohmmadshaikh">
        <input type="text" placeholder="Portfolio / GitHub" value="ccmohmmadshaikh.github.io">
        <input type="text" placeholder="Phone number">
        <input type="text" placeholder="Expected salary" placeholder="$65,000">
      </div>
    </div>
    <button class="btn-submit-apply" onclick="submitApp()">Submit Application →</button>
  </div>
</div>

<!-- ===== POST COMPOSER MODAL ===== -->
<div class="overlay" id="post-composer-overlay" onclick="closeOverlayOutside(event,'post-composer-overlay')">
  <div class="post-modal-box">
    <button class="modal-close" onclick="closeModal('post-composer-overlay')">✕</button>
    <h3>Create a post</h3>
    <textarea id="post-text" placeholder="What's on your mind? Share an update, achievement, or insight..."></textarea>
    <div class="post-modal-actions">
      <div class="post-modal-tools">
        <button class="pm-tool" onclick="toast('Image upload coming soon!','info')">📷</button>
        <button class="pm-tool" onclick="toast('Video upload coming soon!','info')">🎬</button>
        <button class="pm-tool" onclick="toast('Document attach coming soon!','info')">📎</button>
        <button class="pm-tool" onclick="toast('Poll creator coming soon!','info')">📊</button>
      </div>
      <button class="btn-post" onclick="publishPost()">Post</button>
    </div>
  </div>
</div>

<!-- ===== ADD EXPERIENCE MODAL ===== -->
<div class="overlay" id="add-exp-overlay" onclick="closeOverlayOutside(event,'add-exp-overlay')">
  <div class="add-modal-box">
    <button class="modal-close" onclick="closeModal('add-exp-overlay')">✕</button>
    <h3>Add Experience</h3>
    <div class="field"><label>Job Title</label><input type="text" id="exp-title" placeholder="e.g. Security Analyst Intern"></div>
    <div class="field"><label>Company</label><input type="text" id="exp-company" placeholder="Company name"></div>
    <div class="field"><label>Location</label><input type="text" id="exp-location" placeholder="City, ST or Remote"></div>
    <div class="field-row">
      <div class="field"><label>Start date</label><input type="text" id="exp-start" placeholder="Jan 2024"></div>
      <div class="field"><label>End date</label><input type="text" id="exp-end" placeholder="Present"></div>
    </div>
    <div class="field"><label>Employment type</label><select id="exp-type"><option>Full-time</option><option>Part-time</option><option>Internship</option><option>Contract</option><option>Freelance</option></select></div>
    <div class="field"><label>Description</label><textarea id="exp-desc" placeholder="Describe your responsibilities and achievements..."></textarea></div>
    <div class="field"><label>Skills used (comma-separated)</label><input type="text" id="exp-skills" placeholder="Python, Wireshark, SIEM..."></div>
    <button class="btn-block" onclick="addExperience()">Save Experience</button>
  </div>
</div>

<!-- ===== ADD EDUCATION MODAL ===== -->
<div class="overlay" id="add-edu-overlay" onclick="closeOverlayOutside(event,'add-edu-overlay')">
  <div class="add-modal-box">
    <button class="modal-close" onclick="closeModal('add-edu-overlay')">✕</button>
    <h3>Add Education</h3>
    <div class="field"><label>School / University</label><input type="text" id="edu-school" placeholder="Seminole State College"></div>
    <div class="field"><label>Degree</label><input type="text" id="edu-degree" placeholder="e.g. Associate of Science"></div>
    <div class="field"><label>Field of study</label><input type="text" id="edu-field" placeholder="Information Technology & Cybersecurity"></div>
    <div class="field-row">
      <div class="field"><label>Start year</label><input type="text" id="edu-start" placeholder="2022"></div>
      <div class="field"><label>End year</label><input type="text" id="edu-end" placeholder="2025"></div>
    </div>
    <div class="field"><label>GPA (optional)</label><input type="text" id="edu-gpa" placeholder="3.8"></div>
    <div class="field"><label>Activities & clubs (optional)</label><input type="text" id="edu-activities" placeholder="Cybersecurity Club, Dean's List..."></div>
    <div class="field"><label>Description (optional)</label><textarea id="edu-desc" placeholder="Relevant coursework, achievements..."></textarea></div>
    <button class="btn-block" onclick="addEducation()">Save Education</button>
  </div>
</div>

<!-- ===== ADD PROJECT MODAL ===== -->
<div class="overlay" id="add-proj-overlay" onclick="closeOverlayOutside(event,'add-proj-overlay')">
  <div class="add-modal-box">
    <button class="modal-close" onclick="closeModal('add-proj-overlay')">✕</button>
    <h3>Add Project</h3>
    <div class="field"><label>Project name</label><input type="text" id="proj-name" placeholder="NETWATCH/PRO Dashboard"></div>
    <div class="field"><label>Description</label><textarea id="proj-desc" placeholder="What did you build? What problem does it solve?"></textarea></div>
    <div class="field"><label>Technologies used</label><input type="text" id="proj-tech" placeholder="React, Python, Flask, Wireshark..."></div>
    <div class="field"><label>Live URL (optional)</label><input type="text" id="proj-url" placeholder="ccmohmmadshaikh.github.io/..."></div>
    <div class="field"><label>GitHub repo (optional)</label><input type="text" id="proj-github" placeholder="github.com/ccmohmmadshaikh/..."></div>
    <div class="field-row">
      <div class="field"><label>Start</label><input type="text" id="proj-start" placeholder="Jan 2024"></div>
      <div class="field"><label>End</label><input type="text" id="proj-end" placeholder="Present"></div>
    </div>
    <button class="btn-block" onclick="addProject()">Save Project</button>
  </div>
</div>

<!-- ===== ADD CERTIFICATION MODAL ===== -->
<div class="overlay" id="add-cert-overlay" onclick="closeOverlayOutside(event,'add-cert-overlay')">
  <div class="add-modal-box">
    <button class="modal-close" onclick="closeModal('add-cert-overlay')">✕</button>
    <h3>Add Certification</h3>
    <div class="field"><label>Certification name</label><input type="text" id="cert-name" placeholder="CompTIA Security+"></div>
    <div class="field"><label>Issuing organization</label><input type="text" id="cert-org" placeholder="CompTIA"></div>
    <div class="field-row">
      <div class="field"><label>Issue date</label><input type="text" id="cert-date" placeholder="March 2024"></div>
      <div class="field"><label>Expiration (if any)</label><input type="text" id="cert-exp" placeholder="March 2027"></div>
    </div>
    <div class="field"><label>Credential ID</label><input type="text" id="cert-id" placeholder="Credential ID or license #"></div>
    <div class="field"><label>Credential URL</label><input type="text" id="cert-url" placeholder="https://verify.comptia.org/..."></div>
    <button class="btn-block" onclick="addCert()">Save Certification</button>
  </div>
</div>

<!-- ===== ADD SKILL MODAL ===== -->
<div class="overlay" id="add-skill-overlay" onclick="closeOverlayOutside(event,'add-skill-overlay')">
  <div class="add-modal-box">
    <button class="modal-close" onclick="closeModal('add-skill-overlay')">✕</button>
    <h3>Add Skill</h3>
    <div class="field"><label>Skill name</label><input type="text" id="skill-name" placeholder="e.g. Network Security, Python, SIEM..."></div>
    <div class="field"><label>Proficiency level</label>
      <select id="skill-level"><option value="85">Expert (85%+)</option><option value="70">Advanced (70%)</option><option value="55" selected>Intermediate (55%)</option><option value="35">Beginner (35%)</option></select>
    </div>
    <button class="btn-block" onclick="addSkill()">Add Skill</button>
  </div>
</div>

<!-- ===== MASS APPLY OVERLAY ===== -->
<div class="mass-overlay" id="mass-overlay">
  <div class="mass-modal">
    <h3>⚡ Auto-applying to matches...</h3>
    <p class="sub">APEX is submitting tailored applications on your behalf</p>
    <div class="circle-prog">
      <svg width="130" height="130" viewBox="0 0 130 130">
        <circle class="circle-bg" cx="65" cy="65" r="55"/>
        <circle class="circle-fg" cx="65" cy="65" r="55" id="mass-circle"/>
      </svg>
      <div class="circle-text"><div class="big" id="mass-count">0</div><div class="small">applied</div></div>
    </div>
    <div class="mass-list" id="mass-list"></div>
    <button class="btn-done" id="mass-done" onclick="doneMassApply()">All done — view applications ✓</button>
  </div>
</div>

<!-- ===== TOAST ===== -->
<div class="toast" id="toast-el"><div class="toast-dot"></div><span id="toast-msg"></span></div>

<script>
// ========== STATE ==========
const S = {
  user: null,
  users: JSON.parse(localStorage.getItem('apex2_users')||'{}'),
  obData: {},
  obStep: 1,
  tab: 'feed',
  filter: 'all',
  applied: new Set(),
  saved: new Set(),
  resume: null,
  currentJob: null,
  connections: new Set(),
  experiences: [],
  education: [],
  projects: [],
  skills: [],
  certs: [],
  posts: [],
  activeChat: 0
};

// ========== JOB DATA ==========
const JOBS = [
  {id:1,title:'Junior Cybersecurity Analyst',company:'Booz Allen Hamilton',loc:'McLean, VA',type:'Full-time',remote:false,sal:'$65,000–$80,000',match:96,posted:'2d',cat:'cyber',logo:'BA',lc:'#1d4ed8',lb:'rgba(59,130,246,.15)',desc:'Support SOC activities, monitor SIEM alerts, investigate incidents, and assist with vulnerability management across enterprise networks. Excellent entry-level opportunity with top clearance firm.'},
  {id:2,title:'Cybersecurity Intern',company:'Lockheed Martin',loc:'Orlando, FL',type:'Internship',remote:false,sal:'$22–$28/hr',match:94,posted:'1d',cat:'intern',logo:'LM',lc:'#16a34a',lb:'rgba(34,197,94,.12)',desc:'Join our cybersecurity team for a 12-week paid internship. Work on real projects including threat hunting, log analysis, and penetration testing support.'},
  {id:3,title:'Network Security Engineer',company:'Palo Alto Networks',loc:'Santa Clara, CA (Remote)',type:'Full-time',remote:true,sal:'$90,000–$115,000',match:88,posted:'3d',cat:'network',logo:'PA',lc:'#d97706',lb:'rgba(245,158,11,.1)',desc:'Configure and maintain enterprise firewalls, IDS/IPS systems, and VPN infrastructure. Monitor network traffic and respond to security incidents.'},
  {id:4,title:'SOC Analyst (Tier 1)',company:'CrowdStrike',loc:'Austin, TX (Hybrid)',type:'Full-time',remote:false,sal:'$60,000–$75,000',match:91,posted:'5h',cat:'cyber',logo:'CS',lc:'#db2777',lb:'rgba(219,39,119,.1)',desc:'Monitor and triage security alerts using CrowdStrike Falcon platform. Analyze threats, document incidents, and escalate to Tier 2 when necessary.'},
  {id:5,title:'IT Security Specialist',company:'Deloitte',loc:'New York, NY',type:'Full-time',remote:false,sal:'$70,000–$90,000',match:85,posted:'1w',cat:'cyber',logo:'DL',lc:'#7c3aed',lb:'rgba(124,58,237,.1)',desc:'Assist client engagements in risk assessment, compliance (NIST, SOC2, ISO 27001), and security architecture review. Bilingual skills a plus.'},
  {id:6,title:'Network Administrator',company:'SAIC',loc:'San Diego, CA',type:'Full-time',remote:false,sal:'$62,000–$78,000',match:87,posted:'2d',cat:'network',logo:'SA',lc:'#0284c7',lb:'rgba(2,132,199,.1)',desc:'Maintain LAN/WAN infrastructure, configure Cisco switches and routers, troubleshoot connectivity, and document network diagrams.'},
  {id:7,title:'Cybersecurity Analyst Intern',company:'IBM Security',loc:'Remote',type:'Internship',remote:true,sal:'$25–$32/hr',match:93,posted:'3h',cat:'intern',logo:'IB',lc:'#15803d',lb:'rgba(21,128,61,.1)',desc:'Work alongside senior analysts on threat intelligence, vulnerability assessment, and cloud security projects using IBM QRadar SIEM platform.'},
  {id:8,title:'Information Security Analyst',company:'USAA',loc:'San Antonio, TX (Hybrid)',type:'Full-time',remote:false,sal:'$68,000–$85,000',match:83,posted:'4d',cat:'cyber',logo:'US',lc:'#ea580c',lb:'rgba(234,88,12,.1)',desc:'Protect member financial data by monitoring security systems, responding to incidents, and conducting regular risk assessments.'},
  {id:9,title:'Junior Penetration Tester',company:'Rapid7',loc:'Boston, MA (Remote)',type:'Full-time',remote:true,sal:'$72,000–$92,000',match:82,posted:'6d',cat:'cyber',logo:'R7',lc:'#a21caf',lb:'rgba(162,28,175,.1)',desc:'Conduct web application, network, and social engineering assessments. Produce professional reports with remediation recommendations.'},
  {id:10,title:'Cloud Security Engineer',company:'Amazon Web Services',loc:'Seattle, WA (Remote)',type:'Full-time',remote:true,sal:'$105,000–$140,000',match:79,posted:'1w',cat:'cloud',logo:'AW',lc:'#f59e0b',lb:'rgba(245,158,11,.1)',desc:'Design and implement security controls across AWS environments using GuardDuty, Security Hub, and IAM.'},
  {id:11,title:'Network Operations Intern',company:'Verizon',loc:'Alpharetta, GA',type:'Internship',remote:false,sal:'$20–$26/hr',match:80,posted:'2d',cat:'intern',logo:'VZ',lc:'#dc2626',lb:'rgba(220,38,38,.1)',desc:'Assist the NOC team monitoring Verizon network infrastructure, troubleshooting outages, and maintaining uptime SLAs across backbone networks.'},
  {id:12,title:'IT Risk & Compliance Analyst',company:'JPMorgan Chase',loc:'New York, NY (Hybrid)',type:'Full-time',remote:false,sal:'$75,000–$95,000',match:77,posted:'3d',cat:'cyber',logo:'JP',lc:'#1e40af',lb:'rgba(30,64,175,.1)',desc:'Support enterprise risk management, conduct policy reviews, and assist with regulatory compliance (FFIEC, GDPR, PCI-DSS).'},
  {id:13,title:'Cyber Threat Intelligence Analyst',company:'Mandiant (Google)',loc:'Reston, VA (Remote)',type:'Full-time',remote:true,sal:'$85,000–$110,000',match:86,posted:'4d',cat:'cyber',logo:'MG',lc:'#4285f4',lb:'rgba(66,133,244,.1)',desc:'Analyze threat actor TTPs, produce intelligence reports, and brief stakeholders on emerging threats targeting critical infrastructure.'},
  {id:14,title:'Security Operations Engineer',company:'Splunk',loc:'San Francisco, CA',type:'Full-time',remote:true,sal:'$95,000–$125,000',match:81,posted:'5d',cat:'cyber',logo:'SP',lc:'#ef4444',lb:'rgba(239,68,68,.1)',desc:'Build and tune Splunk Enterprise Security detections, create dashboards, and work with customers on SOC optimization.'},
  {id:15,title:'Network Security Intern',company:'Cisco Systems',loc:'San Jose, CA (Hybrid)',type:'Internship',remote:false,sal:'$28–$36/hr',match:90,posted:'1d',cat:'intern',logo:'CI',lc:'#0ea5e9',lb:'rgba(14,165,233,.1)',desc:'Work on next-generation firewall R&D, network security protocols, and enterprise security product testing.'},
];

const PEOPLE = [
  {init:'SR',name:'Sarah Rodriguez',role:'Talent Recruiter · CrowdStrike',color:'#3b82f6',bg:'rgba(59,130,246,.15)'},
  {init:'JM',name:'James Mitchell',role:'Security Engineer · Palo Alto',color:'#a78bfa',bg:'rgba(167,139,250,.15)'},
  {init:'KL',name:'Krista Lee',role:'HR Business Partner · IBM',color:'#22c55e',bg:'rgba(34,197,94,.15)'},
  {init:'TC',name:'Tom Chen',role:'SOC Manager · Booz Allen',color:'#f59e0b',bg:'rgba(245,158,11,.15)'},
  {init:'AP',name:'Aisha Patel',role:'Cybersecurity Analyst · CISA',color:'#ec4899',bg:'rgba(236,72,153,.15)'},
  {init:'RD',name:'Ryan Davis',role:'Network Architect · Verizon',color:'#14b8a6',bg:'rgba(20,184,166,.15)'},
  {init:'MN',name:'Maria Nguyen',role:'Intern Coordinator · NSA',color:'#8b5cf6',bg:'rgba(139,92,246,.15)'},
  {init:'BW',name:'Brian Wilson',role:'CISO · Fortune 500',color:'#ef4444',bg:'rgba(239,68,68,.15)'},
];

const MSGS = [
  {id:0,name:'Sarah Rodriguez',init:'SR',color:'#3b82f6',bg:'rgba(59,130,246,.15)',preview:'Hi! Your profile caught my eye...',unread:true,
   thread:[
    {mine:false,text:"Hi Mohmmad! Your profile caught my eye. We have an opening for a junior security analyst at CrowdStrike. Would you be interested in a quick chat?",time:'10:32 AM'},
    {mine:true,text:"Hi Sarah! Absolutely, I'd love to learn more about the role. What's the position and timeline like?",time:'10:45 AM'},
    {mine:false,text:"It's a full-time SOC Analyst (Tier 1) role based in Austin — hybrid. The team is great and there's a clear path to Tier 2. Comp is around $65–75K. Can you do a video call this week?",time:'11:02 AM'},
  ]},
  {id:1,name:'Tom Chen',init:'TC',color:'#f59e0b',bg:'rgba(245,158,11,.15)',preview:'Your application for SOC Analyst...',unread:true,
   thread:[
    {mine:false,text:"Hello Mohmmad, I reviewed your application for our SOC Analyst position. Your cybersecurity background and multilingual skills are a strong fit. Can you share your availability for a technical screen?",time:'Yesterday'},
    {mine:true,text:"Thank you Tom! I'm available Monday–Friday, mornings preferred. Looking forward to the opportunity.",time:'Yesterday'},
  ]},
  {id:2,name:'Aisha Patel',init:'AP',color:'#ec4899',bg:'rgba(236,72,153,.15)',preview:'Congrats on your GitHub project!',unread:false,
   thread:[
    {mine:false,text:"Hey Mohmmad! I saw your NETWATCH/PRO dashboard on GitHub — really impressive work for an entry-level candidate. What stack did you use?",time:'2d ago'},
    {mine:true,text:"Thanks Aisha! I built it with vanilla JS on the front and Python/Flask for the backend. The network monitoring uses socket data and simulated SIEM alerts.",time:'2d ago'},
    {mine:false,text:"That's awesome! Have you considered adding real packet capture with Scapy? It'd make a great portfolio piece.",time:'2d ago'},
  ]},
];

const NOTIFS = [
  {icon:'👁️',text:'Sarah Rodriguez from CrowdStrike viewed your profile',time:'2h ago',color:'var(--blue)'},
  {icon:'⚡',text:'127 new jobs match your profile — apply now',time:'4h ago',color:'var(--gold)'},
  {icon:'💼',text:'Booz Allen Hamilton saved your profile',time:'1d ago',color:'var(--purple)'},
  {icon:'🔔',text:'Your application to IBM Security was viewed',time:'2d ago',color:'var(--green)'},
  {icon:'🤝',text:'James Mitchell wants to connect',time:'3d ago',color:'var(--text2)'},
];

const FEED_POSTS = [
  {av:'TC',avC:'#f59e0b',avB:'rgba(245,158,11,.15)',name:'Tom Chen',role:'SOC Manager · Booz Allen Hamilton',time:'2h ago',body:"Just wrapped up our annual red team vs. blue team exercise — and for the first time in 3 years, blue team won. 🏆 The key? We finally invested in proper SIEM tuning and incident response playbooks. If you're building a SOC, don't skip the fundamentals. Congrats to the whole security team.",likes:142,comments:28},
  {av:'AP',avC:'#ec4899',avB:'rgba(236,72,153,.15)',name:'Aisha Patel',role:'Cybersecurity Analyst · CISA',time:'5h ago',body:"Hiring for entry-level cybersecurity is broken. Requiring 3+ years experience for 'junior' roles, then wondering why the talent pipeline is dry. We're actively working to change this at CISA — looking for motivated new grads who want to protect critical infrastructure. DM me if you're interested. No experience gatekeeping here. 🔐",likes:891,comments:147},
  {av:'SR',avC:'#3b82f6',avB:'rgba(59,130,246,.15)',name:'Sarah Rodriguez',role:'Talent Recruiter · CrowdStrike',time:'1d ago',body:"Hot take: your GitHub portfolio matters more than your GPA for cybersecurity roles. I've reviewed 200+ applications this quarter and the candidates with live, documented projects on GitHub consistently outperform those with higher grades but no hands-on work. Show your work. Document everything. Link it everywhere.",likes:2340,comments:312},
];

const INT_QS = [
  {q:'What is the difference between IDS and IPS?',a:'An IDS (Intrusion Detection System) monitors and alerts on suspicious traffic but does not block it. An IPS (Intrusion Prevention System) actively blocks or rejects malicious traffic in real time. In your answer, mention that IDS is passive (logs and alerts) while IPS is inline (sits in the traffic path and can drop packets).'},
  {q:'Explain the CIA triad.',a:'Confidentiality (data is only accessible to authorized users), Integrity (data is accurate and has not been tampered with), Availability (systems and data are accessible when needed). Use a real-world example: encrypting data at rest protects confidentiality; checksums verify integrity; redundant systems ensure availability.'},
  {q:'What is the difference between symmetric and asymmetric encryption?',a:'Symmetric uses the same key to encrypt and decrypt (fast, used for large data — AES). Asymmetric uses a public/private key pair (slower, used for key exchange and authentication — RSA, ECC). TLS uses asymmetric to exchange a symmetric session key.'},
  {q:'Walk me through your process when you receive a SIEM alert.',a:'1) Triage: Determine severity and initial context. 2) Investigate: Pull logs, review timeline, identify affected assets. 3) Contain: Isolate if actively exploited. 4) Analyze: Determine root cause, TTPs. 5) Document: Create ticket with full timeline. 6) Escalate if needed. 7) Remediate and close.'},
  {q:'What are common indicators of compromise (IOCs)?',a:'Unusual outbound traffic, beaconing patterns, known malicious IPs/domains, file hashes matching malware signatures, unexpected privilege escalation, failed login spikes, abnormal processes running, unauthorized scheduled tasks, and unusual data exfiltration volumes.'},
];

const BEHAV_QS = [
  {q:'Tell me about a time you solved a complex technical problem.',a:'Use the STAR method: Situation (set the context), Task (your responsibility), Action (specific steps you took), Result (measurable outcome). Example from your projects: debugging the NETWATCH/PRO dashboard, identifying the network monitoring issue, and shipping the fix.'},
  {q:'Describe a situation where you had to explain a technical concept to a non-technical person.',a:"Your Morgan and Morgan experience is perfect here — client relations role where you likely translated legal/technical information for clients. Adapt this: 'I worked in client relations where I regularly had to explain case status and legal processes in plain language...'"},
  {q:'Give an example of a time you had to work under pressure.',a:'Think about academic deadlines, project launches, or client-facing situations at Morgan and Morgan. Focus on: how you prioritized, stayed calm, what process you followed, and what the outcome was.'},
];

const NEWS = [
  {topic:'Threat Intelligence',headline:'New ransomware group targets healthcare sector using zero-day exploit',time:'2h ago'},
  {topic:'Policy',headline:'CISA releases updated cybersecurity framework for critical infrastructure',time:'4h ago'},
  {topic:'Career',headline:'Cybersecurity job openings up 28% in Q1 2025 — Florida leads growth',time:'1d ago'},
  {topic:'Tech',headline:'NIST finalizes post-quantum cryptography standards',time:'2d ago'},
];

const DEFAULT_EXP = [
  {title:'Client Relations Specialist & Case Consultant',company:'Morgan and Morgan',loc:'Orlando, FL',start:'2022',end:'2024',type:'Full-time',desc:'Managed client relationships for one of the largest personal injury law firms in the US. Handled case intake, status communication, and coordinated between clients and legal teams. Consistently exceeded client satisfaction targets.',skills:['Client Relations','Case Management','Communication','CRM Systems'],logo:'M&M',lc:'#1e40af',lb:'rgba(30,64,175,.15)'},
];

const DEFAULT_EDU = [
  {school:'Seminole State College',degree:'Associate of Science',field:'Information Technology & Cybersecurity',start:'2022',end:'2025 (Expected)',gpa:'',activities:'Cybersecurity Club',desc:'Core coursework: Network Security, Ethical Hacking, Digital Forensics, Cloud Computing, System Administration, Python Programming.',logo:'SSC',lc:'#0284c7',lb:'rgba(2,132,199,.15)'},
];

const DEFAULT_PROJECTS = [
  {name:'NETWATCH/PRO',desc:'Full-stack cybersecurity tools dashboard with network monitoring, port scanning visualization, threat feed integration, and SIEM-style alert dashboard. Built with vanilla JS frontend and Python/Flask backend.',tech:['JavaScript','Python','Flask','CSS','Network APIs'],url:'ccmohmmadshaikh.github.io',github:'github.com/ccmohmmadshaikh'},
  {name:'Personal Portfolio Website',desc:'Custom designed and built portfolio website showcasing cybersecurity projects, skills, and professional experience. Fully responsive with modern design.',tech:['HTML','CSS','JavaScript'],url:'ccmohmmadshaikh.github.io',github:'github.com/ccmohmmadshaikh'},
  {name:'Multiplayer Browser Game',desc:'Real-time multiplayer shooting game built with browser-native APIs. Features live player tracking, collision detection, and real-time state sync.',tech:['JavaScript','Canvas API','WebSockets'],url:'ccmohmmadshaikh.github.io',github:'github.com/ccmohmmadshaikh'},
];

const DEFAULT_SKILLS = [
  {name:'Cybersecurity',pct:82},{name:'Network Security',pct:78},{name:'Python',pct:70},{name:'Linux Administration',pct:72},{name:'SIEM Tools',pct:65},{name:'Wireshark / Packet Analysis',pct:68},{name:'Firewall Configuration',pct:60},{name:'Incident Response',pct:63},{name:'SQL / Databases',pct:55},{name:'JavaScript',pct:65},{name:'Client Relations',pct:90},{name:'Communication',pct:92},
];

const DEFAULT_CERTS = [
  {name:'CompTIA Network+',org:'CompTIA',date:'In progress',exp:'—',icon:'🌐'},
  {name:'Google Cybersecurity Certificate',org:'Google / Coursera',date:'2024',exp:'—',icon:'🔐'},
];

const SAL_CITIES = [
  {city:'Washington DC',sal:'$78,000',idx:100},{city:'New York, NY',sal:'$75,000',idx:96},{city:'San Francisco, CA',sal:'$82,000',idx:105},{city:'Orlando, FL',sal:'$62,000',idx:79},{city:'Austin, TX',sal:'$68,000',idx:87},{city:'Remote',sal:'$70,000',idx:90},
];

const COURSES = [
  {name:'Google Cybersecurity Certificate',platform:'Coursera',status:'Completed 2024'},
  {name:'Introduction to Ethical Hacking',platform:'Udemy',status:'Completed 2024'},
  {name:'Python for Security Professionals',platform:'LinkedIn Learning',status:'In Progress'},
];

// ========== INIT ==========
window.onload = () => {
  const sess = localStorage.getItem('apex2_session');
  if(sess){
    S.user = JSON.parse(sess);
    updateNavUser();
    loadProfileData();
    if(S.user.onboarded){showPage('app');initApp()}
    else{showPage('onboard');initOnboard()}
  }
};

function goHome(){
  if(S.user){showPage('app');switchTab('feed')}else{showPage('land')}
}

// ========== PAGES ==========
function showPage(p){
  document.querySelectorAll('.page').forEach(el=>el.classList.remove('active'));
  document.getElementById('pg-'+p).classList.add('active');
}

function updateNavUser(){
  const u = S.user;
  document.getElementById('nav-guest-btns').style.display = u?'none':'block';
  document.getElementById('nav-user-btns').style.display = u?'block':'none';
  document.getElementById('nav-app-links').style.display = u?'flex':'none';
  document.getElementById('nav-search-bar').style.display = u?'flex':'none';
  if(u){
    const init = (u.first[0]+(u.last?u.last[0]:'')).toUpperCase();
    document.getElementById('nav-av').textContent = init;
    document.getElementById('comp-av').textContent = init;
    document.getElementById('rp-av').textContent = init;
  }
}

// ========== AUTH ==========
function openModal(type, sub){
  if(type==='auth'){
    document.getElementById('login-panel').style.display = sub==='login'?'block':'none';
    document.getElementById('signup-panel').style.display = sub==='signup'?'block':'none';
    document.getElementById('auth-overlay').classList.add('open');
  } else if(type==='post-composer'){
    document.getElementById('post-composer-overlay').classList.add('open');
  } else if(type==='add-exp'){
    document.getElementById('add-exp-overlay').classList.add('open');
  } else if(type==='add-edu'){
    document.getElementById('add-edu-overlay').classList.add('open');
  } else if(type==='add-proj'){
    document.getElementById('add-proj-overlay').classList.add('open');
  } else if(type==='add-cert'){
    document.getElementById('add-cert-overlay').classList.add('open');
  } else if(type==='add-skill'){
    document.getElementById('add-skill-overlay').classList.add('open');
  }
}
function closeModal(id){document.getElementById(id).classList.remove('open')}
function closeOverlayOutside(e,id){if(e.target.id===id)closeModal(id)}
function switchAuth(m){
  document.getElementById('login-panel').style.display=m==='login'?'block':'none';
  document.getElementById('signup-panel').style.display=m==='signup'?'block':'none';
}

function doLogin(){
  const e=document.getElementById('li-email').value.trim();
  const pw=document.getElementById('li-pw').value;
  if(!e||!pw){toast('Please fill in all fields','error');return}
  const u=S.users[e];
  if(!u||u.pw!==pw){toast('Invalid email or password','error');return}
  S.user=u;localStorage.setItem('apex2_session',JSON.stringify(u));
  closeModal('auth-overlay');updateNavUser();loadProfileData();
  if(u.onboarded){showPage('app');initApp()}else{showPage('onboard');initOnboard()}
}

function doSignup(){
  const f=document.getElementById('su-first').value.trim();
  const l=document.getElementById('su-last').value.trim();
  const e=document.getElementById('su-email').value.trim();
  const pw=document.getElementById('su-pw').value;
  if(!f||!l||!e||!pw){toast('Please fill all fields','error');return}
  if(pw.length<6){toast('Password must be at least 6 characters','error');return}
  if(S.users[e]){toast('Account already exists — sign in','error');return}
  const u={first:f,last:l,email:e,pw,onboarded:false,resume:null,exps:[],edus:[],projs:[],skills:[],certs:[]};
  S.users[e]=u;localStorage.setItem('apex2_users',JSON.stringify(S.users));
  S.user=u;localStorage.setItem('apex2_session',JSON.stringify(u));
  closeModal('auth-overlay');updateNavUser();showPage('onboard');initOnboard();
}

function doLogout(){
  S.user=null;localStorage.removeItem('apex2_session');updateNavUser();showPage('land');
  document.getElementById('nav-app-links').style.display='none';
  document.getElementById('nav-search-bar').style.display='none';
}

// ========== ONBOARDING ==========
function initOnboard(){
  S.obStep=1;S.obData={};
  document.querySelectorAll('.ob-step').forEach(el=>el.classList.remove('active'));
  document.getElementById('ob1').classList.add('active');
  renderStepBar();
}
function renderStepBar(){
  const bar=document.getElementById('steps-bar');
  if(!bar)return;bar.innerHTML='';
  for(let i=1;i<=6;i++){
    const seg=document.createElement('div');
    seg.className='step-seg'+(i<S.obStep?' done':i===S.obStep?' active':'');
    bar.appendChild(seg);
  }
}
function pickOpt(key,val,el){
  S.obData[key]=val;
  el.closest('.ob-step').querySelectorAll('.opt-card').forEach(c=>c.classList.remove('sel'));
  el.classList.add('sel');
}
function toggleMulti(el,key){
  el.classList.toggle('sel');
  if(!S.obData[key])S.obData[key]=[];
  const txt=el.querySelector('.ml').textContent;
  if(el.classList.contains('sel'))S.obData[key].push(txt);
  else S.obData[key]=S.obData[key].filter(v=>v!==txt);
}
function updSal(inp,disp){
  const v=parseInt(document.getElementById(inp).value);
  document.getElementById(disp).textContent='$'+v.toLocaleString();
}
function handleResume(e){
  const f=e.target.files[0];if(!f)return;
  S.resume=f.name;
  document.getElementById('resume-zone').classList.add('filled');
  const fn=document.getElementById('res-fname');fn.style.display='block';fn.textContent='✓ '+f.name;
  toast('Resume uploaded!','success');
}
function handleAppResume(e){
  const f=e.target.files[0];if(!f)return;
  S.resume=f.name;
  if(S.user){S.user.resume=f.name;localStorage.setItem('apex2_session',JSON.stringify(S.user))}
  document.getElementById('app-res-zone').classList.add('filled');
  document.getElementById('app-res-title').textContent='✓ '+f.name;
  document.getElementById('app-res-sub').textContent='Uploaded & ready';
  document.getElementById('app-res-fname').style.display='block';
  document.getElementById('app-res-fname').textContent=f.name;
  toast('Resume uploaded!','success');
}
function obNext(step){
  if(step===1&&!S.obData.field){toast('Please select your career field','error');return}
  if(step===2&&!S.obData.exp){toast('Please select experience level','error');return}
  if(step===6){finishOnboard();return}
  document.getElementById('ob'+step).classList.remove('active');
  document.getElementById('ob'+(step+1)).classList.add('active');
  S.obStep=step+1;renderStepBar();
}
function obBack(step){
  document.getElementById('ob'+step).classList.remove('active');
  document.getElementById('ob'+(step-1)).classList.add('active');
  S.obStep=step-1;renderStepBar();
}
function finishOnboard(){
  S.user.onboarded=true;S.user.resume=S.resume||null;
  S.users[S.user.email]=S.user;
  localStorage.setItem('apex2_users',JSON.stringify(S.users));
  localStorage.setItem('apex2_session',JSON.stringify(S.user));
  toast('Welcome to APEX! 🎉','success');
  showPage('app');loadProfileData();initApp();
}

// ========== APP INIT ==========
function initApp(){
  S.experiences=[...DEFAULT_EXP,...(S.user.exps||[])];
  S.education=[...DEFAULT_EDU,...(S.user.edus||[])];
  S.projects=[...DEFAULT_PROJECTS,...(S.user.projs||[])];
  S.skills=[...DEFAULT_SKILLS,...(S.user.skills||[])];
  S.certs=[...DEFAULT_CERTS,...(S.user.certs||[])];
  renderAll();
  switchTab('feed');
  document.getElementById('rp-profile-mini').style.display='block';
  document.getElementById('jobs-dot').style.display='block';
  document.getElementById('msg-dot').style.display='block';
  document.getElementById('notif-dot').style.display='block';
}

function loadProfileData(){
  if(!S.user)return;
  const init=(S.user.first[0]+(S.user.last?S.user.last[0]:'')).toUpperCase();
  const name=S.user.first+' '+(S.user.last||'');
  ['nav-av','comp-av','rp-av','prof-av'].forEach(id=>{const el=document.getElementById(id);if(el)el.textContent=init});
  const pn=document.getElementById('prof-name');if(pn)pn.textContent=name;
  const dn=document.getElementById('dash-hi');if(dn)dn.textContent='Good morning, '+S.user.first+' 👋';
  const rn=document.getElementById('rp-name');if(rn)rn.textContent=name;
}

function renderAll(){
  renderFeed();renderDashJobs();renderJobs();renderProfile();renderRightPanel();renderNetwork();renderMessages();renderNotifs();renderInterview();renderSalaryCity();renderResumeSettings();renderCourses();
}

// ========== TABS ==========
function switchTab(tab){
  S.tab=tab;
  document.querySelectorAll('[id^="tab-"]').forEach(el=>el.style.display='none');
  const el=document.getElementById('tab-'+tab);if(el)el.style.display='block';
  document.querySelectorAll('.sb-link').forEach(el=>el.classList.remove('active'));
  const sl=document.getElementById('sl-'+tab);if(sl)sl.classList.add('active');
  document.querySelectorAll('.nav-icon-btn').forEach(el=>el.classList.remove('active'));
  const ni=document.getElementById('ni-'+tab);if(ni)ni.classList.add('active');
  updateStats();
}

function updateStats(){
  const n=S.applied.size;
  ['s-applied','rp-stat-applied'].forEach(id=>{const el=document.getElementById(id);if(el)el.textContent=n});
  ['s-saved','rp-stat-saved'].forEach(id=>{const el=document.getElementById(id);if(el)el.textContent=S.saved.size});
  ['rp-stat-pending'].forEach(id=>{const el=document.getElementById(id);if(el)el.textContent=n});
  const ab=document.getElementById('app-badge');
  if(ab){ab.textContent=n;ab.style.display=n>0?'inline-block':'none'}
  const jb=document.getElementById('jobs-badge');
  if(jb)jb.textContent=JOBS.filter(j=>!S.applied.has(j.id)).length;
}

// ========== FEED ==========
function renderFeed(){
  const posts=[...S.posts,...FEED_POSTS];
  document.getElementById('feed-posts').innerHTML=posts.map((p,i)=>`
    <div class="post-card">
      <div class="post-header">
        <div class="post-avatar" style="background:${p.avB};color:${p.avC}">${p.av}</div>
        <div><div class="post-name">${p.name}</div><div class="post-meta">${p.role} · ${p.time}</div></div>
        <button style="margin-left:auto;background:none;border:none;color:var(--text3);font-size:18px;cursor:pointer">···</button>
      </div>
      <div class="post-body">${p.body}</div>
      <div class="like-count" style="font-size:12px;color:var(--text3);margin-bottom:8px">👍 ${p.likes} likes · ${p.comments} comments</div>
      <div class="post-actions">
        <button class="post-act" id="like-${i}" onclick="likePost(${i},this)"><svg viewBox="0 0 24 24"><path d="M14 9V5a3 3 0 00-3-3l-4 9v11h11.28a2 2 0 002-1.7l1.38-9a2 2 0 00-2-2.3H14z"/><path d="M7 22H4a2 2 0 01-2-2v-7a2 2 0 012-2h3"/></svg> Like</button>
        <button class="post-act"><svg viewBox="0 0 24 24"><path d="M21 15a2 2 0 01-2 2H7l-4 4V5a2 2 0 012-2h14a2 2 0 012 2z"/></svg> Comment</button>
        <button class="post-act"><svg viewBox="0 0 24 24"><circle cx="18" cy="5" r="3"/><circle cx="6" cy="12" r="3"/><circle cx="18" cy="19" r="3"/><line x1="8.59" y1="13.51" x2="15.42" y2="17.49"/><line x1="15.41" y1="6.51" x2="8.59" y2="10.49"/></svg> Share</button>
        <button class="post-act"><svg viewBox="0 0 24 24"><path d="M4 12v8a2 2 0 002 2h12a2 2 0 002-2v-8"/><polyline points="16 6 12 2 8 6"/><line x1="12" y1="2" x2="12" y2="15"/></svg> Send</button>
      </div>
    </div>`).join('');
}
function likePost(i,btn){btn.classList.toggle('liked');toast(btn.classList.contains('liked')?'You liked this post 👍':'Like removed','info')}
function publishPost(){
  const txt=document.getElementById('post-text').value.trim();
  if(!txt){toast('Write something first!','error');return}
  const u=S.user;
  const init=(u.first[0]+(u.last?u.last[0]:'')).toUpperCase();
  S.posts.unshift({av:init,avC:'var(--gold)',avB:'rgba(240,180,41,.15)',name:u.first+' '+u.last,role:'Cybersecurity Student · Seminole State College',time:'Just now',body:txt,likes:0,comments:0});
  closeModal('post-composer-overlay');document.getElementById('post-text').value='';
  renderFeed();switchTab('feed');toast('Post published!','success');
}

// ========== JOBS ==========
function renderJobs(){
  const q=(document.getElementById('job-q')?.value||'').toLowerCase();
  let jobs=JOBS;
  if(S.filter!=='all'){
    if(S.filter==='remote')jobs=jobs.filter(j=>j.remote);
    else if(S.filter==='entry')jobs=jobs.filter(j=>j.match>=85&&j.type!=='Internship');
    else if(S.filter==='intern')jobs=jobs.filter(j=>j.cat==='intern');
    else jobs=jobs.filter(j=>j.cat===S.filter);
  }
  if(q)jobs=jobs.filter(j=>[j.title,j.company,j.loc,...(j.skills||[])].join(' ').toLowerCase().includes(q));
  const el=document.getElementById('jobs-list');
  if(!el)return;
  el.innerHTML=jobs.map(j=>jobCardHTML(j)).join('');
}
function renderDashJobs(){
  const el=document.getElementById('dash-jobs');
  if(!el)return;
  const top=JOBS.filter(j=>!S.applied.has(j.id)).sort((a,b)=>b.match-a.match).slice(0,5);
  el.innerHTML=top.map(j=>jobCardHTML(j,true)).join('');
}
function jobCardHTML(j,compact){
  const app=S.applied.has(j.id);
  const sav=S.saved.has(j.id);
  return `<div class="job-card${app?' applied':''}">
    <div class="jc-top">
      <div class="jc-logo" style="background:${j.lb};color:${j.lc}">${j.logo}</div>
      <div style="flex:1">
        <div class="jc-title">${j.title}</div>
        <div class="jc-company">${j.company} · ${j.loc}</div>
      </div>
      <div class="jc-right"><div class="jc-salary">${j.sal}</div><div class="jc-posted">${j.posted} ago</div></div>
    </div>
    <div class="jc-tags">
      <span class="jc-tag match">⚡ ${j.match}% match</span>
      <span class="jc-tag">${j.type}</span>
      ${j.remote?'<span class="jc-tag remote">🏠 Remote</span>':''}
    </div>
    ${!compact?`<div class="jc-desc">${j.desc}</div>`:''}
    <div class="jc-actions">
      ${app?'<button class="btn-apply done" disabled>✓ Applied</button>':`<button class="btn-apply" onclick="openApplyModal(${j.id})">Apply now →</button>`}
      <button class="btn-save${sav?' saved':''}" onclick="toggleSave(${j.id},this)">${sav?'🔖 Saved':'Bookmark'}</button>
      <span style="font-size:11px;color:var(--text3);margin-left:auto">via APEX</span>
    </div>
  </div>`;
}
function setFilter(f,el){
  S.filter=f;
  document.querySelectorAll('.filter-row .chip').forEach(c=>c.classList.remove('active'));
  el.classList.add('active');renderJobs();
}
function toggleSave(id,btn){
  if(S.saved.has(id)){S.saved.delete(id);btn.textContent='Bookmark';btn.classList.remove('saved');toast('Removed from saved','info')}
  else{S.saved.add(id);btn.textContent='🔖 Saved';btn.classList.add('saved');toast('Job saved! 🔖','success')}
  updateStats();if(S.tab==='saved')renderSaved();
}
function renderSaved(){
  const el=document.getElementById('saved-list');if(!el)return;
  if(S.saved.size===0){el.innerHTML='<div style="text-align:center;padding:60px;color:var(--text3)"><div style="font-size:40px;margin-bottom:12px">🔖</div><div style="font-size:16px;font-weight:700;margin-bottom:6px">No saved jobs</div><div style="font-size:13px">Bookmark jobs to review later</div></div>';return}
  el.innerHTML=JOBS.filter(j=>S.saved.has(j.id)).map(j=>jobCardHTML(j)).join('');
}
function renderApplications(){
  const el=document.getElementById('applications-list');if(!el)return;
  if(S.applied.size===0){el.innerHTML='<div style="text-align:center;padding:60px;color:var(--text3)"><div style="font-size:40px;margin-bottom:12px">📬</div><div style="font-size:16px;font-weight:700;margin-bottom:6px">No applications yet</div><div style="font-size:13px">Start applying to jobs and they\'ll appear here</div><button style="margin-top:16px;background:var(--gold);color:#000;border-radius:8px;padding:10px 20px;font-size:14px;font-weight:700;font-family:var(--font-head)" onclick="switchTab(\'jobs\')">Find jobs →</button></div>';return}
  el.innerHTML=JOBS.filter(j=>S.applied.has(j.id)).map(j=>`<div class="job-card applied">
    <div class="jc-top">
      <div class="jc-logo" style="background:${j.lb};color:${j.lc}">${j.logo}</div>
      <div style="flex:1"><div class="jc-title">${j.title}</div><div class="jc-company">${j.company} · ${j.loc}</div></div>
      <div><span style="background:rgba(240,180,41,.1);color:var(--gold);font-size:12px;font-weight:700;padding:4px 12px;border-radius:100px;border:1px solid rgba(240,180,41,.2)">Pending review</span></div>
    </div>
    <div class="jc-tags"><span class="jc-tag">${j.type}</span><span class="jc-tag" style="color:var(--green);background:rgba(34,197,94,.08)">✓ Applied via APEX</span></div>
  </div>`).join('');
}

// ========== APPLY MODAL ==========
function openApplyModal(id){
  const j=JOBS.find(x=>x.id===id);if(!j)return;
  S.currentJob=id;
  document.getElementById('am-title').textContent=j.title;
  document.getElementById('am-co').textContent=j.company+' · '+j.loc;
  const rn=S.resume||S.user?.resume||'Resume_'+((S.user?.first||'User')+'_'+(S.user?.last||''))+'.pdf';
  document.getElementById('am-res-name').textContent=rn;
  document.getElementById('am-cover').value=`Dear Hiring Team at ${j.company},\n\nI am writing to express my strong interest in the ${j.title} position. As a final-semester Cybersecurity & IT student at Seminole State College with hands-on experience building security tools and a background in client-facing communication at Morgan and Morgan, I am confident I can contribute meaningfully to your team from day one.\n\nMy projects — including NETWATCH/PRO, a full-stack cybersecurity monitoring dashboard — demonstrate my ability to apply theoretical knowledge to real-world security scenarios. I am multilingual (English, Urdu, Hindi), open to relocation, and available immediately.\n\nThank you for your consideration. I look forward to connecting.\n\nBest regards,\n${S.user?.first||'Mohmmad'} ${S.user?.last||'Shaikh'}`;
  document.getElementById('apply-overlay').classList.add('open');
}
function closeApplyIfOutside(e){if(e.target.id==='apply-overlay')closeModal('apply-overlay')}
function submitApp(){
  const id=S.currentJob;if(!id)return;
  S.applied.add(id);
  closeModal('apply-overlay');
  toast('Application submitted! ✓','success');
  renderDashJobs();renderJobs();renderApplications();updateStats();
}

// ========== MASS APPLY ==========
function startMassApply(){
  const eligible=JOBS.filter(j=>!S.applied.has(j.id)&&j.match>=80);
  if(eligible.length===0){toast('All high-match jobs already applied to!','info');return}
  const overlay=document.getElementById('mass-overlay');
  overlay.classList.add('open');
  document.getElementById('mass-list').innerHTML=eligible.map(j=>`<div class="mass-item" id="mi-${j.id}"><div class="mi-dot pending" id="md-${j.id}"></div><div class="mi-info"><div class="role">${j.title}</div><div class="co">${j.company} · ${j.loc}</div></div></div>`).join('');
  document.getElementById('mass-count').textContent='0';
  document.getElementById('mass-circle').style.strokeDashoffset='345';
  document.getElementById('mass-done').style.display='none';
  let i=0,total=eligible.length;
  function step(){
    if(i>0){const prev=eligible[i-1];document.getElementById('md-'+prev.id).className='mi-dot done';document.getElementById('md-'+prev.id).textContent='✓';document.getElementById('mi-'+prev.id).classList.remove('active');S.applied.add(prev.id)}
    if(i<total){
      const cur=eligible[i];
      document.getElementById('md-'+cur.id).className='mi-dot going';
      document.getElementById('mi-'+cur.id).classList.add('active');
      document.getElementById('mi-'+cur.id).scrollIntoView({block:'nearest'});
      const pct=i/total;
      document.getElementById('mass-circle').style.strokeDashoffset=345-(345*pct);
      document.getElementById('mass-count').textContent=i;
      i++;setTimeout(step,280+Math.random()*200);
    } else {
      document.getElementById('mass-circle').style.strokeDashoffset='0';
      document.getElementById('mass-count').textContent=total;
      document.getElementById('mass-done').style.display='inline-block';
      toast(`Applied to ${total} jobs!`,'success');
    }
  }
  step();
}
function doneMassApply(){
  document.getElementById('mass-overlay').classList.remove('open');
  renderDashJobs();renderJobs();renderApplications();updateStats();switchTab('applications');
}

// ========== PROFILE ==========
function renderProfile(){
  renderExpList();renderEduList();renderProjList();renderSkillList();renderCertList();renderLangs();renderVol();renderRecos();renderAwards();renderCourses();
}
function renderExpList(){
  const el=document.getElementById('exp-list');if(!el)return;
  el.innerHTML=S.experiences.map(e=>`<div class="exp-item">
    <div class="exp-logo" style="background:${e.lb};color:${e.lc}">${e.logo}</div>
    <div style="flex:1">
      <div class="exp-role">${e.title}</div>
      <div class="exp-company">${e.company}${e.loc?' · '+e.loc:''}</div>
      <div class="exp-date">${e.start}${e.end?' – '+e.end:''} · ${e.type||'Full-time'}</div>
      ${e.desc?`<div class="exp-desc">${e.desc}</div>`:''}
      ${e.skills&&e.skills.length?`<div class="exp-tags">${e.skills.map(s=>`<span class="exp-tag">${s}</span>`).join('')}</div>`:''}
    </div>
  </div>`).join('');
}
function renderEduList(){
  const el=document.getElementById('edu-list');if(!el)return;
  el.innerHTML=S.education.map(e=>`<div class="edu-item">
    <div class="edu-logo" style="background:${e.lb};color:${e.lc}">${e.logo}</div>
    <div>
      <div class="exp-role">${e.school}</div>
      <div class="exp-company">${e.degree}${e.field?' · '+e.field:''}</div>
      <div class="exp-date">${e.start}${e.end?' – '+e.end:''}</div>
      ${e.gpa?`<div class="exp-desc">GPA: ${e.gpa}</div>`:''}
      ${e.activities?`<div class="exp-desc">Activities: ${e.activities}</div>`:''}
      ${e.desc?`<div class="exp-desc">${e.desc}</div>`:''}
    </div>
  </div>`).join('');
}
function renderProjList(){
  const el=document.getElementById('proj-list');if(!el)return;
  el.innerHTML=S.projects.map(p=>`<div class="project-card">
    <h4>${p.name} ${p.url?`<a class="project-link" href="#" onclick="toast('Opening: ${p.url}','info');return false">🔗 Live</a>`:''} ${p.github?`<a class="project-link" href="#" onclick="toast('Opening GitHub repo','info');return false">⌥ GitHub</a>`:''}</h4>
    <p>${p.desc}</p>
    <div class="project-tech">${(p.tech||[]).map(t=>`<span class="tech-tag">${t}</span>`).join('')}</div>
  </div>`).join('');
}
function renderSkillList(){
  const el=document.getElementById('skills-list');if(!el)return;
  el.innerHTML=S.skills.map(s=>`<div class="skill-row">
    <div class="skill-name">${s.name}</div>
    <div class="skill-bar"><div class="skill-fill" style="width:${s.pct}%"></div></div>
    <div class="skill-pct">${s.pct}%</div>
    <span class="endorse-count">+${Math.floor(Math.random()*40+5)}</span>
  </div>`).join('');
}
function renderCertList(){
  const el=document.getElementById('certs-list');if(!el)return;
  el.innerHTML=S.certs.map(c=>`<div class="cert-item">
    <div class="cert-icon">${c.icon||'🏅'}</div>
    <div><div class="cert-name">${c.name}</div><div class="cert-by">${c.org}</div><div class="cert-date">Issued ${c.date}${c.exp&&c.exp!=='—'?' · Expires '+c.exp:''}</div></div>
  </div>`).join('');
}
function renderLangs(){
  const el=document.getElementById('langs-list');if(!el)return;
  const langs=[{n:'English',l:'Native / Bilingual',d:5},{n:'Urdu',l:'Native / Bilingual',d:5},{n:'Hindi',l:'Full professional proficiency',d:4}];
  el.innerHTML=langs.map(l=>`<div class="lang-item">
    <div><div class="lang-name">${l.n}</div><div class="lang-level">${l.l}</div></div>
    <div class="lang-dots">${[1,2,3,4,5].map(i=>`<div class="ld ${i<=l.d?'filled':'empty'}"></div>`).join('')}</div>
  </div>`).join('');
}
function renderVol(){
  const el=document.getElementById('vol-list');if(!el)return;
  el.innerHTML=`<div class="vol-item"><div class="vol-icon">🛡️</div><div><div style="font-size:14px;font-weight:700">Cybersecurity Awareness Volunteer</div><div style="font-size:12px;color:var(--text3)">Community Education Initiative · 2024–Present</div><div style="font-size:13px;color:var(--text2);margin-top:4px">Teach basic cybersecurity hygiene, phishing awareness, and password best practices to seniors and community members.</div></div></div>`;
}
function renderRecos(){
  const el=document.getElementById('reco-list');if(!el)return;
  el.innerHTML=`<div class="reco-card"><div class="quote">"Mohmmad is one of the most driven and client-focused professionals I've had the pleasure of working alongside. His ability to communicate complex information clearly to clients — while maintaining warmth and professionalism — was outstanding. A strong communicator who will thrive in any technical role."</div><div class="from"><div class="reco-av" style="background:rgba(59,130,246,.15);color:var(--blue)">JP</div><div><div style="font-size:13px;font-weight:700">Jennifer Park</div><div style="font-size:12px;color:var(--text3)">Senior Case Manager · Morgan and Morgan</div></div></div></div>`;
}
function renderAwards(){
  const el=document.getElementById('awards-list');if(!el)return;
  el.innerHTML=`<div class="award-item"><div class="award-icon">🏆</div><div><div style="font-size:14px;font-weight:700">Dean's List Recognition</div><div style="font-size:12px;color:var(--text3)">Seminole State College · 2023–2024</div></div></div>
  <div class="award-item"><div class="award-icon">⭐</div><div><div style="font-size:14px;font-weight:700">Top Performer — Client Services</div><div style="font-size:12px;color:var(--text3)">Morgan and Morgan · 2023</div></div></div>`;
}
function renderCourses(){
  const el=document.getElementById('courses-list');if(!el)return;
  el.innerHTML=COURSES.map(c=>`<div style="display:flex;justify-content:space-between;align-items:center;padding:10px 0;border-bottom:1px solid var(--border)"><div><div style="font-size:14px;font-weight:600">${c.name}</div><div style="font-size:12px;color:var(--text3)">${c.platform}</div></div><span style="font-size:12px;color:var(--green);font-weight:600">${c.status}</span></div>`).join('');
}

// ========== ADD PROFILE ITEMS ==========
function addExperience(){
  const title=document.getElementById('exp-title').value.trim();
  const company=document.getElementById('exp-company').value.trim();
  if(!title||!company){toast('Please fill in at least title and company','error');return}
  const init=company.split(' ').map(w=>w[0]).join('').slice(0,3).toUpperCase();
  const colors=[['#3b82f6','rgba(59,130,246,.15)'],['#22c55e','rgba(34,197,94,.15)'],['#a78bfa','rgba(167,139,250,.15)'],['#f59e0b','rgba(245,158,11,.15)']];
  const [lc,lb]=colors[Math.floor(Math.random()*colors.length)];
  const skills=document.getElementById('exp-skills').value.split(',').map(s=>s.trim()).filter(Boolean);
  S.experiences.unshift({title,company,loc:document.getElementById('exp-location').value,start:document.getElementById('exp-start').value,end:document.getElementById('exp-end').value,type:document.getElementById('exp-type').value,desc:document.getElementById('exp-desc').value,skills,logo:init,lc,lb});
  if(S.user){S.user.exps=S.experiences.filter((_,i)=>i<S.experiences.length-DEFAULT_EXP.length);localStorage.setItem('apex2_session',JSON.stringify(S.user))}
  closeModal('add-exp-overlay');renderExpList();toast('Experience added!','success');
}
function addEducation(){
  const school=document.getElementById('edu-school').value.trim();
  if(!school){toast('Please enter school name','error');return}
  const init=school.split(' ').map(w=>w[0]).join('').slice(0,3).toUpperCase();
  S.education.unshift({school,degree:document.getElementById('edu-degree').value,field:document.getElementById('edu-field').value,start:document.getElementById('edu-start').value,end:document.getElementById('edu-end').value,gpa:document.getElementById('edu-gpa').value,activities:document.getElementById('edu-activities').value,desc:document.getElementById('edu-desc').value,logo:init,lc:'#0284c7',lb:'rgba(2,132,199,.15)'});
  closeModal('add-edu-overlay');renderEduList();toast('Education added!','success');
}
function addProject(){
  const name=document.getElementById('proj-name').value.trim();
  if(!name){toast('Please enter a project name','error');return}
  const tech=document.getElementById('proj-tech').value.split(',').map(t=>t.trim()).filter(Boolean);
  S.projects.unshift({name,desc:document.getElementById('proj-desc').value,tech,url:document.getElementById('proj-url').value,github:document.getElementById('proj-github').value,start:document.getElementById('proj-start').value,end:document.getElementById('proj-end').value});
  closeModal('add-proj-overlay');renderProjList();toast('Project added!','success');
}
function addCert(){
  const name=document.getElementById('cert-name').value.trim();
  if(!name){toast('Please enter certification name','error');return}
  S.certs.push({name,org:document.getElementById('cert-org').value,date:document.getElementById('cert-date').value,exp:document.getElementById('cert-exp').value||'—',icon:'🏅'});
  closeModal('add-cert-overlay');renderCertList();toast('Certification added!','success');
}
function addSkill(){
  const name=document.getElementById('skill-name').value.trim();
  if(!name){toast('Enter a skill name','error');return}
  const pct=parseInt(document.getElementById('skill-level').value);
  S.skills.unshift({name,pct});
  closeModal('add-skill-overlay');renderSkillList();toast('Skill added!','success');
}

// ========== RIGHT PANEL ==========
function renderRightPanel(){
  const matches=JOBS.filter(j=>!S.applied.has(j.id)).sort((a,b)=>b.match-a.match).slice(0,5);
  document.getElementById('rp-matches').innerHTML=matches.map(j=>`<div class="match-row" onclick="switchTab('jobs')">
    <div class="match-logo-sm" style="background:${j.lb};color:${j.lc}">${j.logo}</div>
    <div class="match-info"><div class="match-title">${j.title}</div><div class="match-co">${j.company}</div></div>
    <div class="match-pct">${j.match}%</div>
  </div>`).join('');
  document.getElementById('rp-news').innerHTML=NEWS.map(n=>`<div class="news-item">
    <div class="topic">${n.topic}</div><div class="headline">${n.headline}</div><div class="time">${n.time}</div>
  </div>`).join('');
}

// ========== NETWORK ==========
function renderNetwork(){
  const el=document.getElementById('network-grid');if(!el)return;
  el.innerHTML=PEOPLE.map((p,i)=>`<div class="network-card">
    <div class="net-banner"></div>
    <div class="net-av" style="background:${p.bg};color:${p.color}">${p.init}</div>
    <div class="net-name">${p.name}</div>
    <div class="net-role">${p.role}</div>
    <button class="btn-net-connect ${S.connections.has(i)?'connected':''}" id="nc-${i}" onclick="toggleConnect(${i},this)">${S.connections.has(i)?'✓ Connected':'+ Connect'}</button>
  </div>`).join('');
}
function toggleConnect(i,btn){
  if(S.connections.has(i)){S.connections.delete(i);btn.textContent='+ Connect';btn.classList.remove('connected')}
  else{S.connections.add(i);btn.textContent='✓ Connected';btn.classList.add('connected');toast('Connection request sent!','success')}
}

// ========== MESSAGES ==========
let chatThread=[];
function renderMessages(){
  const el=document.getElementById('msg-list-inner');if(!el)return;
  el.innerHTML=MSGS.map((m,i)=>`<div class="msg-row${i===S.activeChat?' active':''}" onclick="openChat(${i})">
    <div class="msg-av" style="background:${m.bg};color:${m.color}">${m.init}</div>
    <div style="flex:1;min-width:0"><div style="display:flex;justify-content:space-between"><div class="msg-name">${m.name}</div><div class="msg-time">${m.thread[m.thread.length-1].time}</div></div>
    <div class="msg-preview">${m.preview}</div></div>
    ${m.unread?'<div class="msg-unread"></div>':''}
  </div>`).join('');
  openChat(S.activeChat);
}
function openChat(i){
  S.activeChat=i;const m=MSGS[i];chatThread=[...m.thread];
  document.getElementById('chat-av').textContent=m.init;
  document.getElementById('chat-av').style.background=m.bg;
  document.getElementById('chat-av').style.color=m.color;
  document.getElementById('chat-name').textContent=m.name;
  renderChatMsgs();m.unread=false;renderMessages();
}
function renderChatMsgs(){
  const el=document.getElementById('chat-msgs');if(!el)return;
  el.innerHTML=chatThread.map(m=>`<div class="chat-msg ${m.mine?'mine':'theirs'}">
    <div class="chat-bubble">${m.text}</div>
    <div class="chat-time">${m.time}</div>
  </div>`).join('');
  el.scrollTop=el.scrollHeight;
}
function sendMsg(){
  const inp=document.getElementById('chat-inp');
  const txt=inp.value.trim();if(!txt)return;
  chatThread.push({mine:true,text:txt,time:'Just now'});
  inp.value='';renderChatMsgs();
  setTimeout(()=>{
    const replies=['That sounds great! I\'ll follow up with more details shortly.','Excellent! Let me check with the team and get back to you.','Thanks for reaching out. Let\'s schedule a call this week.'];
    chatThread.push({mine:false,text:replies[Math.floor(Math.random()*replies.length)],time:'Just now'});
    renderChatMsgs();
  },1200);
}

// ========== NOTIFICATIONS ==========
function renderNotifs(){
  const el=document.getElementById('notif-list');if(!el)return;
  el.innerHTML=NOTIFS.map(n=>`<div class="rp-card" style="display:flex;gap:14px;align-items:flex-start;cursor:pointer" onclick="toast('Opening notification...','info')">
    <div style="width:40px;height:40px;border-radius:50%;background:rgba(240,180,41,.1);display:flex;align-items:center;justify-content:center;font-size:20px;flex-shrink:0">${n.icon}</div>
    <div><div style="font-size:14px;line-height:1.5">${n.text}</div><div style="font-size:12px;color:var(--text3);margin-top:4px">${n.time}</div></div>
  </div>`).join('');
}

// ========== INTERVIEW ==========
function renderInterview(){
  const el=document.getElementById('interview-qs');const bel=document.getElementById('behavioral-qs');
  if(!el||!bel)return;
  el.innerHTML=INT_QS.map((q,i)=>`<div class="question-item" onclick="this.classList.toggle('open')">
    <div class="q">${q.q}</div>
    <div class="a">${q.a}</div>
    <div class="toggle">Tap to see answer guide ↓</div>
  </div>`).join('');
  bel.innerHTML=BEHAV_QS.map(q=>`<div class="question-item" onclick="this.classList.toggle('open')">
    <div class="q">${q.q}</div>
    <div class="a">${q.a}</div>
    <div class="toggle">Tap to see answer guide ↓</div>
  </div>`).join('');
}

// ========== SALARY ==========
function renderSalaryCity(){
  const el=document.getElementById('salary-by-city');if(!el)return;
  el.innerHTML=SAL_CITIES.map(c=>`<div style="display:flex;align-items:center;gap:12px;margin-bottom:10px">
    <div style="width:130px;font-size:13px;font-weight:600;flex-shrink:0">${c.city}</div>
    <div style="flex:1;height:6px;background:var(--border2);border-radius:3px;overflow:hidden"><div style="width:${c.idx}%;height:100%;border-radius:3px;background:linear-gradient(90deg,var(--gold),var(--gold2))"></div></div>
    <div style="font-size:13px;font-weight:700;color:var(--green);min-width:60px;text-align:right">${c.sal}</div>
  </div>`).join('');
}

// ========== RESUME SETTINGS ==========
function renderResumeSettings(){
  const el=document.getElementById('resume-settings');if(!el)return;
  const settings=[
    {label:'Auto-tailor resume per job',sub:'AI rewrites sections to match each job description',on:true},
    {label:'ATS keyword optimization',sub:'Inject relevant keywords before submission',on:true},
    {label:'Auto-generate cover letters',sub:'Unique cover letter per application using your history',on:true},
    {label:'Ghost mode (private search)',sub:'Your current employer cannot see your activity',on:true},
    {label:'Mass apply automation',sub:'Apply to all 80%+ matches with one click',on:false},
  ];
  el.innerHTML=settings.map((s,i)=>`<div style="display:flex;align-items:center;justify-content:space-between;padding:12px 0;border-bottom:1px solid var(--border)">
    <div><div style="font-size:14px;font-weight:600">${s.label}</div><div style="font-size:12px;color:var(--text3);margin-top:2px">${s.sub}</div></div>
    <div style="width:44px;height:24px;border-radius:100px;background:${s.on?'var(--gold)':'var(--border2)'};position:relative;cursor:pointer;flex-shrink:0;transition:background .2s" onclick="this.style.background=this.dataset.on==='1'?'var(--border2)':'var(--gold)';this.dataset.on=this.dataset.on==='1'?'0':'1';this.querySelector('div').style.transform=this.dataset.on==='1'?'translateX(20px)':'translateX(2px)'" data-on="${s.on?'1':'0'}"><div style="width:18px;height:18px;border-radius:50%;background:#fff;position:absolute;top:3px;left:3px;transition:transform .2s;transform:translateX(${s.on?'20':'0'}px)"></div></div>
  </div>`).join('');
}

// ========== GLOBAL SEARCH ==========
function globalSearch(q){
  if(!q)return;
  if(q.length>2){switchTab('jobs');document.getElementById('job-q').value=q;renderJobs()}
}

// ========== TOAST ==========
let toastT;
function toast(msg,type='info'){
  clearTimeout(toastT);
  const el=document.getElementById('toast-el');
  document.getElementById('toast-msg').textContent=msg;
  el.className='toast '+type+' show';
  toastT=setTimeout(()=>el.classList.remove('show'),3500);
}
</script>
</body>
</html>
