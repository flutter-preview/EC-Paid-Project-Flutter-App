'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/NOTICES": "476d5651a908209cba7b74634d55575a",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"assets/AssetManifest.bin": "a64d3e9f163b20172fd25af26d23acbc",
"assets/AssetManifest.json": "0c21ce35228d958142710b7c4f235700",
"assets/FontManifest.json": "0efbba0875f047cb0ea7512b62ac22d9",
"assets/images/login-background.jpg": "97c5ad67da60c87c3a3176807e7caf4f",
"assets/images/ec-logo.png": "efbb5a1dd925b84bc574b52482454009",
"assets/images/LPG5.png": "7a56240dab5fabf88ba0463d06003190",
"assets/images/shoe.png": "2c9887e3f3402f0d5cd411c9e496610c",
"assets/images/profile.png": "765012cc5490bbca9c5b66284b90465f",
"assets/images/logo.png": "4c58ff631ae2eb401d6f3e588827791d",
"assets/images/login-background3.jpg": "432347cef965221d19a1e6971f9c5d21",
"assets/images/logo2.jpg": "f5923ac67854ad597812f07e06a757c1",
"assets/images/LPG4.jpeg": "e7a4a4200397ebba15c6ac65899c012e",
"assets/images/discount2.jpg": "943efcbcfc9dfd9f9a62dfdffd301424",
"assets/images/logo2.png": "937c3b7cbf4ee9fcc379c6120cbd79ad",
"assets/images/LPG7.jpeg": "dd174bac1ea0d5a120ee3c97d76ccfa1",
"assets/images/login-background2.png": "1ff81630ffb0b7091ea93139cbc4da4f",
"assets/images/discount3.jpg": "c09d670f2789577063886fd308da112f",
"assets/images/loginPage.jpeg": "bc5622d74f6b89e6d5c80aa82de09d04",
"assets/images/LPG2.jpeg": "277efa124b93fdbf4fd5df5dc18cfdf6",
"assets/images/LPG6.jpeg": "b98ad1358fc1a22765be49b43f940020",
"assets/images/logo1-removebg-preview.png": "4c58ff631ae2eb401d6f3e588827791d",
"assets/images/food.png": "55e5b15feb0a299ee4de1a116696e2fe",
"assets/images/LPG3.jpg": "26360a70ac1428844de5af586e5c0c3d",
"assets/images/discount1.jpg": "a62d19fc490640f2520881da4b83b776",
"assets/images/LPG1.jpeg": "fb9f593500a392b3a60d1a7993e64f10",
"assets/images/login-background2.jpg": "dfe796e0c71913a5e918919d98ae0ad7",
"assets/images/LPG.jpg": "78fa5b574e3dfd1128b2bc9b665bf5fd",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e91b78ab65738101ec9717353447ef3f",
"assets/packages/line_awesome_flutter/lib/fonts/LineAwesome.ttf": "4fe1928e582fd2e3316275954fc92e86",
"assets/fonts/MaterialIcons-Regular.otf": "a363f93fc75518b2df11d9c5333407bf",
"assets/fonts/Nunito-Italic.ttf": "ce460427f5742744a5a062cce0fdf93e",
"assets/fonts/Nunito-Bold.ttf": "91019ffb3b1df640e444b34e5a73dfc3",
"assets/fonts/Nunito-Regular.ttf": "0c890be2af0d241a2387ad2c4c16af2c",
"index.html": "8f4702c054420b131c38584643e111c0",
"/": "8f4702c054420b131c38584643e111c0",
"main.dart.js": "f0b836d02d281c38586c35e51b8222e2",
"flutter.js": "6fef97aeca90b426343ba6c5c9dc5d4a",
"canvaskit/canvaskit.js": "76f7d822f42397160c5dfc69cbc9b2de",
"canvaskit/skwasm.worker.js": "19659053a277272607529ef87acf9d8a",
"canvaskit/skwasm.js": "1df4d741f441fa1a4d10530ced463ef8",
"canvaskit/skwasm.wasm": "6711032e17bf49924b2b001cef0d3ea3",
"canvaskit/chromium/canvaskit.js": "8c8392ce4a4364cbb240aa09b5652e05",
"canvaskit/chromium/canvaskit.wasm": "fc18c3010856029414b70cae1afc5cd9",
"canvaskit/canvaskit.wasm": "f48eaf57cada79163ec6dec7929486ea",
"version.json": "1b09d659093390c3a579c634b4302d0d",
"manifest.json": "379df0751a8928814cc017c8cae3294e",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"favicon.png": "5dcef449791fa27946b3d35ad8803796"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
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
