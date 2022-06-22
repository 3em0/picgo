/*#include <LiquidCrystal_I2C.h> //引用I2C库
#include <Wire.h>
LiquidCrystal_I2C lcd(0x27,16,2);

void lcdinit();
void setup() 
{
  lcdinit();
}

void loop() {
// put your main code here, to run repeatedly:
lcd.setBacklight(1);
lcd.setCursor(5,0);
lcd.print("hello!");
delay(2000);
lcd.clear();
lcd.setCursor(5,1);
lcd.print("world!");
delay(2000);
lcd.clear();

}

void lcdinit()
{
  lcd.init(); // 初始化LCD
  lcd.backlight(); //设置LCD背景等亮
  lcd.setCursor(4,0); //设置显示指针
  lcd.print("Welcome!"); //输出字符到LCD1602上
  lcd.setCursor(3,1);
  lcd.print("Version1.0");
  delay(2000);
  lcd.clear();
}*/
