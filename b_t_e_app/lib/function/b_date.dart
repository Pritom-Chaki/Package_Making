import 'package:b_t_e_app/function/b_to_e.dart';

class BanglaDate {
  static Map<String, dynamic> setDateEng(DateTime tarikh) {
    const List<String> dayName = [
      'Sunday',
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday'
    ];
    const List<String> monthName = [
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December"
    ];
    Map<String, int> arg = {
      "date": tarikh.day,
      'month': tarikh.month + 1,
      'year': tarikh.year,
    };
    Map<String, dynamic> dateEn = {
      "day": dayName[tarikh.day],
      "date": tarikh.day,
      "month": monthName[tarikh.month],
      "year": tarikh.year
    };

    Map<String, dynamic> dateBd = getDatebd(arg);
    return {"dateEn": dateEn, 'dateBd': dateBd};
  }

  static Map<String, dynamic> getDatebd(Map<String, int> arg) {
    const String rojAdd = ' রোজ ';
    const esheAdd = {'e': ' ই', 'she': ' শে'};
    const String kalAdd = ' কাল';
    const String abodo = ' বঙ্গাব্দ';
    const List<String> monthName = [
      'বৈশাখ', //0
      'জ্যৈষ্ঠ ', //1
      'আষাঢ় ', //2
      'শ্রাবণ ', //3
      'ভাদ্র', //4
      'আশ্বিন ', //5
      'কার্তিক ', //6
      'অগ্রহায়ণ ', //7
      'পৌষ ', //8
      'মাঘ', //9
      'ফাল্গুন ', //10
      'চৈত্র ' //11
    ];

    const List<String> dayName = [
      'বৃহস্পতিবার',
      'শুক্রবার',
      'শনিবার',
      'রবিবার',
      'সোমবার',
      'মঙ্গলবার',
      'বুধবার',
    ];

    const List<String> session = [
      'গ্রীষ্ম',
      'বর্ষা',
      'শরৎ',
      'হেমন্ত',
      'শীত',
      'বসন্ত',
    ];
    convertNumber(n) => TransLateNumber.engToBan(n.toString());

    //todo
    addEe(n) {
      final x, y;
      x = n >= 10 && n < 20 ? esheAdd['e'] : '';
      y = n >= 20 && n <= 31 ? esheAdd['she'] : '';
      return x || y ? y + x : '';
    }

    getYear(dmy) =>
        dmy.month <= 4 && dmy.date <= 13 ? dmy.year - 594 : dmy.year - 593;

    getMonthDate(d, m) {
      if (m == 1 && d <= 13) {
        m = 8;
        d = d + 17;
      } else if (m == 1 && d > 13) {
        m = 9;
        d = d - 13;
      } else if (m == 2 && d <= 12) {
        m = 9;
        d = d + 18;
      } else if (m == 2 && d > 12) {
        m = 10;
        d = d - 12;
      } else if (m == 3 && d <= 14) {
        m = 10;
        d = d + 16;
      } else if (m == 3 && d > 14) {
        m = 11;
        d = d - 14;
      } else if (m == 4 && d <= 13) {
        m = 11;
        d = d + 17;
      } else if (m == 4 && d > 13) {
        m = 0;
        d = d - 13;
      } else if (m == 5 && d <= 14) {
        m = 0;
        d = d + 17;
      } else if (m == 5 && d > 14) {
        m = 1;
        d = d - 14;
      } else if (m == 6 && d <= 14) {
        m = 1;
        d = d + 17;
      } else if (m == 6 && d > 14) {
        m = 2;
        d = d - 14;
      } else if (m == 7 && d <= 15) {
        m = 2;
        d = d + 16;
      } else if (m == 7 && d > 15) {
        m = 3;
        d = d - 15;
      } else if (m == 8 && d <= 15) {
        m = 3;
        d = d + 16;
      } else if (m == 8 && d > 15) {
        m = 4;
        d = d - 15;
      } else if (m == 9 && d <= 15) {
        m = 4;
        d = d + 16;
      } else if (m == 9 && d > 15) {
        m = 5;
        d = d - 15;
      } else if (m == 10 && d <= 15) {
        m = 5;
        d = d + 15;
      } else if (m == 10 && d > 15) {
        m = 6;
        d = d - 15;
      } else if (m == 11 && d <= 14) {
        m = 6;
        d = d + 16;
      } else if (m == 11 && d > 14) {
        m = 7;
        d = d - 14;
      } else if (m == 12 && d <= 14) {
        m = 7;
        d = d + 16;
      } else if (m == 12 && d > 14) {
        m = 8;
        d = d - 14;
      } else {
        m = false;
        d = false;
      }
      return {'month': m, 'date': d};
    }

    var GetdayName = dayName[arg['day']!];
    final daymon = getMonthDate(arg['day'], arg['month']);
    final getSession = session[(daymon['month'] / 2).floor];

    return {
      'day': rojAdd + GetdayName,
      'date': convertNumber(daymon['month']) + addEe(daymon['date']),
      'month': monthName[daymon['month']],
      'session': getSession + kalAdd,
      'year': convertNumber(getYear(arg)) + abodo,
    };
  }
}
