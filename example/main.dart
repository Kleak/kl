// Copyright (c) 2017, kleak. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:async';
import 'package:angular2/angular2.dart';
import 'package:angular2/platform/browser.dart';
import 'package:kl/kl.dart';

@Component(
  selector: 'my-app',
  templateUrl: 'app_component.html',
  styleUrls: const ['app_component.css'],
  directives: const [
    KlContainer,
    KlColumn,
    KlRow,
    KlText,
    KlImage,
    KlFlexible,
  ],
)
class AppComponent implements OnInit {
  KlConstraint fixedWidthAndHeight =
      new KlConstraint(width: "100px", height: "100px");

  KlDecoration border = new KlDecoration(
    border: new KlBoxBorder.all(
      new KlBorder(
        size: 3,
        style: KlBorderStyle.double,
      ),
    ),
    backgroundColor: new KlColor.fromRGB(0, 255, 0),
    borderRadius: 3,
  );

  KlDecoration borderTopOnly = new KlDecoration(
    border: new KlBoxBorder.only(
      top: new KlBorder(
        size: 3,
        style: KlBorderStyle.solid,
        color: new KlColor.fromRGB(0, 0, 255),
      ),
    ),
  );

  KlEdgeInsets margin = new KlEdgeInsets.all(12);

  KlTextStyle textStyle = new KlTextStyle(
      color: new KlColor.fromRGB(255, 0, 0), fontFamily: 'serif');

  KlAlignItem alignCenter = KlAlignItem.center;

  String defaultImageData =
      'data:image/png;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBwgHBgkIBwgKCgkLDRYPDQwMDRsUFRAWIB0iIiAdHx8kKDQsJCYxJx8fLT0tMTU3Ojo6Iys/RD84QzQ5OjcBCgoKDQwNGg8PGjclHyU3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3N//AABEIAHkAeQMBIgACEQEDEQH/xAAaAAADAQEBAQAAAAAAAAAAAAAAAQIEAwUH/8QAKxAAAgIBAQcDAwUAAAAAAAAAAAECEQMhBBIUMVJhoUFRkRMicSMyQmLB/8QAFgEBAQEAAAAAAAAAAAAAAAAAAAEC/8QAFBEBAAAAAAAAAAAAAAAAAAAAAP/aAAwDAQACEQMRAD8A+sJFIEi0jSEkUkNIpIBJDSKSHQE0FF0KgJoVHShUBzaJcTq0S0ByaJaOrRLQHJoRbRIHSKLSFFFpACVlJAkUAA6SbeiQzDtmVyn9NP7Y8+7A6T2yKb+nHe7vRHLjMnTD4ZnADZDbVyyQrujVFxnHei012PJO2zZXjyJN/bLmB6BLRYgIZLRbRLQHKSJo6tE0BaRaJRSAoYkNAPlqzx27dvm9T2HqqPH5aAAAAQAAAerie9ihJ83FFE4VWGC/qiwqWS0WyWBzkiS2SBaLRES0AxiGAHl7TDczzXe/k9QybfjuMci9NH+AMQAAQFY47+SMfd0Satgx3N5H6aL8hW4AABCYyXyAlklMkCkWjnEpAWMSGAClFSTjLVPmDkoq5NJe7M+ba4RX6f3S8IDDJbsnH2bQg1btu2+YAB6uGCx44xXovk8o24NrjuqOXRr+QGsBRlGSuMk12djYCExslsCZEjZIDiy0cky0wHlyxxQ3mr9kYp7Tlk/3bq9olba7yRXtH/TOA223cm2+4gAIAAAAAAAWjtafg6x2jLHlO17PU5AFejgzrMnpTXNFtmHZHWZd00bGwE2SNsmwFFlpnJMtMDltGKeTJcFaquZz4fL0r5RsTGmBj4bL0+UHDZenyjcmNMDBwubp8oOFzdPlHoWFoDz+FzdPlBw2Xp8o9CxNgYOGy9PlC4fL0r5RvbJYGXDhnDLGUo0lfqjS2DZDYA2TYpMQCRSdEDA6RZaZyRaAux2QMC7CyQAqxWIQDbE2ITAGyGxskBNiAQH/2Q==';
  KlConstraint messageConstraint;
  KlEdgeInsets imageMargin = new KlEdgeInsets.only(right: 20);
  KlDecoration imageDecoration = new KlDecoration(borderRadius: 50);
  KlObjectFit imageObjectFit = KlObjectFit.cover;
  KlConstraint hundredPercent = new KlConstraint(height: "100%");
  KlJustifyContent justifyContent = KlJustifyContent.spaceBetween;

  void ngOnInit() {
    var small = true;
    final smallMessage = new KlConstraint(height: "100px");
    final bigMessage = new KlConstraint(height: "200px");
    messageConstraint = small ? smallMessage : bigMessage;

    new Timer.periodic(new Duration(seconds: 5), (Timer t) {
      small = !small;
      messageConstraint = small ? smallMessage : bigMessage;
    });
  }
}

void main() {
  bootstrap(AppComponent);
}
