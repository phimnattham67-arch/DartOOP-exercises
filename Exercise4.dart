// 1. มิกซ์อิน (THE MIXIN)
// มิกซ์อินช่วยให้เรานำโค้ดไปใช้ซ้ำในคลาสอื่นๆ ได้โดยไม่ต้องสืบทอด (extends)
mixin CloudLogger {
  void logToCloud(String message) {
    // ในแอปจริง โค้ดส่วนนี้จะส่งข้อมูลไปยังระบบฐานข้อมูล เช่น Firebase
    print("☁️ [Cloud Log]: $message");
  }
}

// 2. คลาสแบบเจเนอริกส์ (THE GENERIC CLASS)
// <T> ย่อมาจาก "Type" ทำให้คลาสนี้สามารถเก็บข้อมูลชนิดใดก็ได้ (String, int, ฯลฯ)
// สังเกตการใช้ 'with CloudLogger' เพื่อนำฟังก์ชันจากมิกซ์อินมาใช้งาน!
class AppDataCache<T> with CloudLogger {
  T? cachedData; // T? หมายความว่าตัวแปรนี้อาจเก็บข้อมูลชนิด T หรือเป็น null ก็ได้

  // TODO 1
  void saveData(T newData) {
    cachedData = newData;
    logToCloud("บันทึกข้อมูลแล้ว: $cachedData");
  }

  // TODO 2
  void clearData() {
    cachedData = null;
    logToCloud("ล้างข้อมูลในแคชแล้ว");
  }
}

void main() {
  print("=== กำลังแคชข้อมูลแบบสตริง (User Token) ===\n");

  // เราระบุ <String> เพื่อบอกให้คอมไพเลอร์ทราบว่า T ในที่นี้คือ String
  AppDataCache<String> tokenCache = AppDataCache<String>();

  // TODO 3
  tokenCache.saveData("ABC-123");

  // TODO 4
  tokenCache.clearData();

  print("\n=== กำลังแคชข้อมูลแบบตัวเลข (High Score) ===\n");

  // TODO 5
  AppDataCache<int> scoreCache = AppDataCache<int>();

  // TODO 6
  scoreCache.saveData(9999);
}