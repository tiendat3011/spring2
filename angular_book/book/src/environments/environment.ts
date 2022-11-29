// This file can be replaced during build by using the `fileReplacements` array.
// `ng build --prod` replaces `environment.ts` with `environment.prod.ts`.
// The list of file replacements can be found in `angular.json`.

export const environment = {
  production: false,
  apiUrl: 'http://localhost:8080/api/public/books',
  apiUrl1: 'http://localhost:8080/api/public/customer',
  firebaseConfig: {
    apiKey: 'AIzaSyBJ8krphcGm4zAPrGaQrdO75BRBX3QpFS0',
    authDomain: 'tam-le-112a8.firebaseapp.com',
    projectId: 'tam-le-112a8',
    storageBucket: 'tam-le-112a8.appspot.com',
    messagingSenderId: '373728916440',
    appId: '1:373728916440:web:d15385ff4d08453b8638ad',
    measurementId: 'G-63ZVSQPZHV',
    databaseURL: 'https://tam-le-112a8-default-rtdb.asia-southeast1.firebasedatabase.app/'
  },
  firebaseConfigs: {
    apiKey: 'AIzaSyA24pCmeT6oZps2Nc3gSMqf5vVGzb8SbTM',
    authDomain: 'chat-746ba.firebaseapp.com',
    databaseURL: 'https://chat-746ba-default-rtdb.asia-southeast1.firebasedatabase.app',
    projectId: 'chat-746ba',
    storageBucket: 'chat-746ba.appspot.com',
    messagingSenderId: '68660347693',
    appId: '1:68660347693:web:fc23b517bcb73d62f949a4'
  }
};

/*
 * For easier debugging in development mode, you can import the following file
 * to ignore zone related error stack frames such as `zone.run`, `zoneDelegate.invokeTask`.
 *
 * This import should be commented out in production mode because it will have a negative impact
 * on performance if an error is thrown.
 */
// import 'zone.js/dist/zone-error';  // Included with Angular CLI.
