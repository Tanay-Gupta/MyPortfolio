'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "412c21e84715bdfdfc642149e034fc74",
"assets/AssetManifest.bin.json": "a595c3a1c9aa6c29b7ebfd27f4a69522",
"assets/AssetManifest.json": "63d925b3514d1d67e51652f16fe0a01b",
"assets/assets/fonts/visuelt/VisueltPro-Black.ttf": "691b6f9aa3ee625e3cd8da2f8849a126",
"assets/assets/fonts/visuelt/VisueltPro-Bold.ttf": "18acd33c965a455418d4204f0f334ea8",
"assets/assets/fonts/visuelt/VisueltPro-ExtraLight.ttf": "90bfa0766e43260710e3c6ac0f78c9e9",
"assets/assets/fonts/visuelt/VisueltPro-Light.ttf": "2a1df2ff00c2611bf1b7fdeeaeebfa59",
"assets/assets/fonts/visuelt/VisueltPro-Medium.ttf": "cf4dbc20776a2b309fe30a9bbfe7de0a",
"assets/assets/fonts/visuelt/VisueltPro-Regular.ttf": "0f8cd2494eb8c5e3a33352b2dd38fd61",
"assets/assets/fonts/visuelt/VisueltPro-Thin.ttf": "82d7b5b67c24f00acb08f2dccf1fd03b",
"assets/assets/images/Algorithmic_Toolbox_cert.png": "2a9beafe4fc67e9c18405a917fcdd017",
"assets/assets/images/circle.png": "663d5187ada8666bfa87120d1665605f",
"assets/assets/images/cn8.png": "4a7e877e70d4f8b82c5e510fb80d55b6",
"assets/assets/images/dev_meditate.png": "99235c256b39d2aac3e510400527f04d",
"assets/assets/images/dev_meditate1.png": "17d74e1248922fd6d3d31dd1d69cccaa",
"assets/assets/images/dev_meditate3.png": "5787138e5800f80749d81b9b786b8ca8",
"assets/assets/images/down-arrow-2.png": "de203dedb01f2871b4ebbec490c20a6c",
"assets/assets/images/down-arrow.png": "4393cd5feeb20fb468c7eb223d1bbd06",
"assets/assets/images/google_play.png": "7c42f3803d546db3d393106501dba541",
"assets/assets/images/ios-down-arrow.png": "fa4679d2972f1d11355142a60ed34ede",
"assets/assets/images/javabasic.png": "3fb690f3644d8f2c37a3d72da6948b81",
"assets/assets/images/oops.png": "27416bdbe974bec0ffe0ad093a1464d7",
"assets/assets/images/problemsolving.png": "3141c7aeb1a40d8183cb2a48417f356d",
"assets/assets/images/projects/ailaan/1.png": "5fc5089dbf8a092bf253881df1e8180f",
"assets/assets/images/projects/ailaan/2.png": "42f97fed2ed1306d4e9b063196854c82",
"assets/assets/images/projects/ailaan/3.png": "23a2ac4ce4760de9b89e8a62a5695e40",
"assets/assets/images/projects/ailaan/4.png": "c0af55f60fe6506133dfd544568e5929",
"assets/assets/images/projects/ailaan/5.png": "e00130c007966a308e888b4237e41000",
"assets/assets/images/projects/ailaan/6.png": "0f40ee295c35a678810b031f3d6e4099",
"assets/assets/images/projects/ailaan/7.png": "0f67235bd4e412fa28feab992924da02",
"assets/assets/images/projects/ailaan/ailaan_cover.png": "5fc5089dbf8a092bf253881df1e8180f",
"assets/assets/images/projects/ailaan/mockups.png": "07ec04dcb6f96604190e91d41e7ef9cd",
"assets/assets/images/projects/cititzensafety/1.jpg": "f4bf80500bdce7aa8b81ccda20cfc162",
"assets/assets/images/projects/datingappauth/1.png": "8ee084e6d61d15b2bc03191f9d6647a7",
"assets/assets/images/projects/datingappauth/sample1.png": "6404e39b7b2b229874ec45f0ccdc0d97",
"assets/assets/images/projects/datingappauth/sample2.png": "982b35254de3b88583812ab882e7222c",
"assets/assets/images/projects/lazyshare/1.png": "635a7ab3d22c80c7e7c296e715a7c181",
"assets/assets/images/projects/lazyshare/2.png": "9ca049b73f79ca050062d2fc8716dc4e",
"assets/assets/images/projects/lazyshare/3.png": "0a8d9113a9979670f8f084817a33e70e",
"assets/assets/images/projects/lazyshare/4.png": "4885ba4b380a589f3487fb8c7eb56511",
"assets/assets/images/projects/lazyshare/5.png": "aa7e2da2329c2a60f525ebaa7c713d8d",
"assets/assets/images/projects/lazyshare/6.png": "e4fab1e28dbc45cb904ab649563dc4a5",
"assets/assets/images/projects/lazyshare/7.png": "5a1fb1894779520882d1e0b09032b9a7",
"assets/assets/images/projects/notifyx/1.png": "7d1f38d1b289236047c2713a2ed5fdb7",
"assets/assets/images/projects/notifyx/2.png": "5b8e595050f3f56c125b267b7506cd8e",
"assets/assets/images/projects/notifyx/3.png": "206952d8cb92b67f4f1edf9b911d155a",
"assets/assets/images/projects/notifyx/4.png": "e086047bae90e2d61fc80e9fb6034a08",
"assets/assets/images/projects/notifyx/5.png": "aee9ace4f4d837fdd630dbbd7d22b1d2",
"assets/assets/images/projects/notifyx/6.png": "43254fe1305cc3fcb033284ed65e6bd1",
"assets/assets/images/projects/notifyx/7.png": "bb81f928aebdceac14106398bb023109",
"assets/assets/images/projects/notifyx/8.png": "1d7ae29917ce56bf02613dfa6a71c648",
"assets/assets/images/projects/notifyx/9.png": "11e220647bf742ddd7c254da244f40f2",
"assets/assets/images/projects/thesocialapp/1.png": "93db9d765b4b8e15db98f545eef883f5",
"assets/assets/images/projects/thesocialapp/2.png": "30dd648f66bd9e80d4402531f6758bf3",
"assets/assets/images/projects/thesocialapp/3.png": "a5f92fff5943e7e0b653e5286ef547ad",
"assets/assets/images/projects/thesocialapp/4.png": "1e7d0040f8e77be989bbb9bc4408c4cc",
"assets/assets/images/right-arrow.png": "62a7bab73a0fe40acd3f4555adfcab91",
"assets/assets/images/skills.png": "b8bb3800c1b97898aee10e7f9ce5c39a",
"assets/assets/images/skills1.png": "b8bb3800c1b97898aee10e7f9ce5c39a",
"assets/assets/images/skills2.png": "b8bb3800c1b97898aee10e7f9ce5c39a",
"assets/assets/images/tanay-gupta-cv.pdf": "908e9d2c7334f7cc781d581d8ada0e17",
"assets/assets/images/tanay_gupta.png": "c2ad57fc0275645a4b1d47c8511a23ce",
"assets/assets/images/up-arrow.png": "d0c6457f5704962b99f0e6aa3e9b18e7",
"assets/assets/images/works.png": "5c6f8eb3a22f703781aad6c2528cf0cd",
"assets/assets/images/ws.png": "f70ee2bfe19482de80afb81dfe1b7098",
"assets/FontManifest.json": "99b137f57cb5675c961e74e7a15cde29",
"assets/fonts/MaterialIcons-Regular.otf": "b1654b0dbb0ad1d5e3569acb985ef4aa",
"assets/NOTICES": "270471c4880e8a47d8b2ca95b2a1c45e",
"assets/packages/flutter_feather_icons/fonts/feather.ttf": "40469726c5ed792185741388e68dd9e8",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "64f4360a2f6340cd6bcad080adcd196c",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "f3307f62ddff94d2cd8b103daf8d1b0f",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "781b07dae47f4e6c89811824a2263f47",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "c86fbd9e7b17accae76e5ad116583dc4",
"canvaskit/canvaskit.js.symbols": "38cba9233b92472a36ff011dc21c2c9f",
"canvaskit/canvaskit.wasm": "3d2a2d663e8c5111ac61a46367f751ac",
"canvaskit/chromium/canvaskit.js": "43787ac5098c648979c27c13c6f804c3",
"canvaskit/chromium/canvaskit.js.symbols": "4525682ef039faeb11f24f37436dca06",
"canvaskit/chromium/canvaskit.wasm": "f5934e694f12929ed56a671617acd254",
"canvaskit/skwasm.js": "445e9e400085faead4493be2224d95aa",
"canvaskit/skwasm.js.symbols": "741d50ffba71f89345996b0aa8426af8",
"canvaskit/skwasm.wasm": "e42815763c5d05bba43f9d0337fa7d84",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "c71a09214cb6f5f8996a531350400a9a",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "9f9e2356a235570563186e95083b2041",
"/": "9f9e2356a235570563186e95083b2041",
"main.dart.js": "b1ba9dc51f11499aa3f086c3a01653a0",
"manifest.json": "25e92899897156db24d67e8b8e828d81",
"version.json": "a706bb2a7cbe82321e8fe1f804070804"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
