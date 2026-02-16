# yoshunko_modify
# ![title](assets/img/title.png)

[[English]](README_EN.md)

**yoshunko_modify** คือโปรแกรมจำลองเซิร์ฟเวอร์ (Server Emulator) สำหรับเกม **Zenless Zone Zero** ดัดแปลงและดูแลโดย **xeroxua** โดยมีเป้าหมายหลักคือการมอบฟีเจอร์ที่หลากหลายและการปรับแต่งที่ยืดหยุ่น ในขณะที่ยังคงรักษาความเรียบง่ายของโค้ดไว้ **yoshunko_modify** ไม่มีการใช้ไลบรารีภายนอก (Third-party dependencies) ยกเว้น Zig standard library เท่านั้น

## เริ่มต้นใช้งาน
### สิ่งที่จำเป็น
- [Zig 0.16.0-dev.1470](https://cold-eu-par-1.gofile.io/download/web/e5598401-64b5-4759-9f0d-85a1ba370d77/x86_64-linux-0.16.0-dev.1470%2B32dc46aae.tar.xz)
- [SDK Server](https://git.xeondev.com/reversedrooms/hoyo-sdk/releases)
- [Tentacle](https://github.com/xeerookuma-dev/Custom-Patch-Sen-Z)
- [KCPShim](https://git.xeondev.com/xeon/kcpshim)

##### หมายเหตุ: เซิร์ฟเวอร์นี้ไม่มี SDK Server มาให้ในตัว เนื่องจากไม่ได้เจาะจงเฉพาะเกมใดเกมหนึ่ง คุณสามารถใช้ `hoyo-sdk` ร่วมกับเซิร์ฟเวอร์นี้ได้
##### หมายเหตุ 2: เซิร์ฟเวอร์นี้ทำงานบนระบบปฏิบัติการจริงๆ เท่านั้น เช่น GNU/Linux หากคุณไม่มี สามารถใช้งานผ่าน `WSL` ได้

#### หากต้องการความช่วยเหลือเพิ่มเติม สามารถเข้าร่วม [Discord Server](https://discord.gg/QwfTnEdAtN) ของเราได้

### การติดตั้ง
#### การ Build จากซอร์สโค้ด
```sh
# เข้าไปยังโฟลเดอร์โปรเจกต์
git clone https://git.xeondev.com/yoshunko/yoshunko_modify.git
cd yoshunko_modify
zig build run-dpsv &
zig build run-gamesv
```

### การตั้งค่า (Configuration)
**yoshunko_modify** ไม่มีไฟล์ตั้งค่า (Config file) โดยเฉพาะ แต่สามารถปรับเปลี่ยนพฤติกรรมได้ผ่านการจัดการโฟลเดอร์ `state`:
- **Regions**: รายชื่อโซนที่ `dpsv` ให้บริการ จะถูกกำหนดไว้ในโฟลเดอร์ `state/gateway`
- **Player Data**: ข้อมูลของผู้เล่นแต่ละคนจะถูกเก็บในรูปแบบไฟล์ระบบ อยู่ที่โฟลเดอร์ `state/player/[UID]` ไฟล์เหล่านี้สามารถแก้ไขได้ตลอดเวลา และเซิร์ฟเวอร์จะทำการโหลดข้อมูลใหม่ (Hot-reload) และซิงค์ข้อมูลกับตัวเกมทันที

### การเข้าสู่ระบบ
เวอร์ชั่นตัวเกมที่รองรับในปัจจุบันคือ `CNBetaWin2.7.1`

1. ติดตั้ง **Client Patch** (Tentacle) ที่จำเป็น เพื่อให้สามารถเชื่อมต่อกับเซิร์ฟเวอร์โลคอลได้ และเปลี่ยนคีย์เข้ารหัสเป็นคีย์แบบกำหนดเอง
2. รัน **KCPShim** ซึ่งทำหน้าที่เป็นตัวกลางในการแปลงแพ็กเก็ตระหว่าง Client และ Server ผ่าน KCP เป็น TCP และในทางกลับกัน

## คอมมูนิตี้
- [Discord Server ของเรา](https://discord.gg/QwfTnEdAtN)

## ที่มา
- [Yoshunko](https://git.xeondev.com/yoshunko/yoshunko)

---
*ดูแลโดย ❤️ xeroxua*
