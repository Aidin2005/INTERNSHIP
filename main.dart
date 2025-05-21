import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Для форматирования даты

void main() {
  runApp(const AdminPanelApp());
}

class AdminPanelApp extends StatefulWidget {
  const AdminPanelApp({super.key});

  @override
  State<AdminPanelApp> createState() => _AdminPanelAppState();
}

class _AdminPanelAppState extends State<AdminPanelApp> {
  bool _isDarkTheme = false;
  String _language = 'Русский';

  final List<News> _news = [
    News(
      month: 'APRIL',
      date: '24',
      title: 'Semester Start',
      description: 'The new semester will start on May 1',
    ),
    News(
      month: 'APRIL',
      date: '20',
      title: 'Meeting',
      description: 'Staff meeting at 3:00 PM',
    ),
  ];

  final List<Message> _messages = [
    Message(
      sender: 'John Smith',
      text: 'Reminder: Staff meeting tomorrow at 3 PM',
      date: DateTime(2025, 5, 20, 10, 30),
    ),
    Message(
      sender: 'Anna Johnson',
      text: 'Please review the new schedule',
      date: DateTime(2025, 5, 21, 9, 0),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Admin Panel',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.grey[100],
        cardColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(color: Colors.black),
        ),
      ),
      darkTheme: ThemeData.dark().copyWith(
        primaryColor: Colors.blue,
        scaffoldBackgroundColor: Colors.grey[900],
        cardColor: Colors.grey[850],
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF222222),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(color: Colors.white),
        ),
      ),
      themeMode: _isDarkTheme ? ThemeMode.dark : ThemeMode.light,
      home: AdminPanelScreen(
        news: _news,
        messages: _messages,
        isDarkTheme: _isDarkTheme,
        language: _language,
        onThemeChanged: (val) => setState(() => _isDarkTheme = val),
        onLanguageChanged: (lang) => setState(() => _language = lang),
      ),
    );
  }
}

// Пример функции для получения перевода
String getLabel(BuildContext context, String key, String language) {
  final labels = {
    'ru': {
      'profile': 'Профиль администратора',
      'theme': 'Тёмная тема',
      'language': 'Язык',
      'about': 'О приложении',
      'version': 'Версия 1.0.0',
      'settings': 'Настройки',
      'home': 'Главная',
      'teachers': 'Учителя',
      'news': 'Новости',
      'messages': 'Сообщения',
      'schedule': 'Расписание',
      'announcements': 'Объявления',
      'recent_messages': 'Последние сообщения',
      'add': 'Добавить',
      'save': 'Сохранить',
      'cancel': 'Отмена',
      'edit_teacher': 'Редактировать учителя',
      'add_teacher': 'Добавить учителя',
      'name': 'Имя',
      'phone': 'Телефон',
      'gmail': 'Почта',
      'info': 'Инфо',
      'salary': 'Зарплата',
      'edit_news': 'Редактировать новость',
      'add_news': 'Добавить новость',
      'month': 'Месяц',
      'date': 'Дата',
      'title': 'Заголовок',
      'description': 'Описание',
      'edit_message': 'Редактировать сообщение',
      'add_message': 'Добавить сообщение',
      'sender': 'Отправитель',
      'message': 'Сообщение',
      'subject': 'Предмет',
      'teacher': 'Преподаватель',
      'time': 'Время',
      'room': 'Кабинет',
      'no_teachers': 'Учителей пока нет.',
      'no_news': 'Новостей пока нет.',
      'no_messages': 'Сообщений пока нет.',
      'no_schedules': 'Расписаний пока нет.',
    },
    'en': {
      'profile': 'Admin Profile',
      'theme': 'Dark Theme',
      'language': 'Language',
      'about': 'About App',
      'version': 'Version 1.0.0',
      'settings': 'Settings',
      'home': 'Home',
      'teachers': 'Teachers',
      'news': 'News',
      'messages': 'Messages',
      'schedule': 'Schedule',
      'announcements': 'Announcements',
      'recent_messages': 'Recent Messages',
      'add': 'Add',
      'save': 'Save',
      'cancel': 'Cancel',
      'edit_teacher': 'Edit Teacher',
      'add_teacher': 'Add Teacher',
      'name': 'Name',
      'phone': 'Phone',
      'gmail': 'Gmail',
      'info': 'Info',
      'salary': 'Salary',
      'edit_news': 'Edit News',
      'add_news': 'Add News',
      'month': 'Month',
      'date': 'Date',
      'title': 'Title',
      'description': 'Description',
      'edit_message': 'Edit Message',
      'add_message': 'Add Message',
      'sender': 'Sender',
      'message': 'Message',
      'subject': 'Subject',
      'teacher': 'Teacher',
      'time': 'Time',
      'room': 'Room',
      'no_teachers': 'No teachers added yet.',
      'no_news': 'No news added yet.',
      'no_messages': 'No messages added yet.',
      'no_schedules': 'No schedules yet.',
    },
  };
  return labels[language == 'Русский' ? 'ru' : 'en']?[key] ?? key;
}

// Модель для SHEDULE
class Schedule {
  String subject;
  String teacher;
  String time;
  String room;

  Schedule({
    required this.subject,
    required this.teacher,
    required this.time,
    required this.room,
  });
}

// Модель для учителя
class Teacher {
  String name;
  String phone;
  String gmail;
  String info;
  double salary;

  Teacher({
    required this.name,
    required this.phone,
    required this.gmail,
    required this.info,
    required this.salary,
  });
}

// Модель для новости
class News {
  String month;
  String date;
  String title;
  String description;

  News({
    required this.month,
    required this.date,
    required this.title,
    required this.description,
  });
}

// Модель для сообщения
class Message {
  String sender;
  String text;
  DateTime date;

  Message({required this.sender, required this.text, required this.date});
}

class AdminPanelScreen extends StatefulWidget {
  final List<News> news;
  final List<Message> messages;
  final bool isDarkTheme;
  final String language;
  final ValueChanged<bool> onThemeChanged;
  final ValueChanged<String> onLanguageChanged;

  const AdminPanelScreen({
    super.key,
    required this.news,
    required this.messages,
    required this.isDarkTheme,
    required this.language,
    required this.onThemeChanged,
    required this.onLanguageChanged,
  });

  @override
  State<AdminPanelScreen> createState() => _AdminPanelScreenState();
}

class _AdminPanelScreenState extends State<AdminPanelScreen> {
  int _selectedIndex = 0;
  int? _customPage; // null — обычные вкладки, 1 — Schedule

  // Пример списка учителей (можно вынести выше)
  final List<Teacher> _teachers = [
    Teacher(
      name: 'John Smith',
      phone: '+1234567890',
      gmail: 'john.smith@gmail.com',
      info: 'Mathematics teacher',
      salary: 50000,
    ),
    Teacher(
      name: 'Anna Johnson',
      phone: '+0987654321',
      gmail: 'anna.johnson@gmail.com',
      info: 'Physics teacher',
      salary: 55000,
    ),
  ];

  final List<Schedule> _schedules = [];

  void _onNavBarTap(int index) {
    setState(() {
      _selectedIndex = index;
      _customPage = null;
    });
  }

  Widget _getBody() {
    if (_customPage == 1) {
      return SchedulePage(
        schedules: _schedules,
        teachers: _teachers,
        language: widget.language,
        onBack: () {
          setState(() {
            _customPage = null;
          });
        },
      );
    }
    if (_selectedIndex == 1) {
      return TeachersScreen(
        teachers: _teachers,
        language: widget.language,
        onBack: () {
          setState(() {
            _selectedIndex = 0;
          });
        },
      );
    }
    if (_selectedIndex == 2) {
      return NewsScreen(
        news: widget.news,
        language: widget.language,
        onBack: () {
          setState(() {
            _selectedIndex = 0;
          });
        },
      );
    }
    if (_selectedIndex == 3) {
      return MessagesScreen(
        messages: widget.messages,
        language: widget.language,
        onBack: () {
          setState(() {
            _selectedIndex = 0;
          });
        },
      );
    }
    if (_selectedIndex == 4) {
      return SettingsScreen(
        isDarkTheme: widget.isDarkTheme,
        language: widget.language,
        onThemeChanged: widget.onThemeChanged,
        onLanguageChanged: widget.onLanguageChanged,
        onBack: () {
          setState(() {
            _selectedIndex = 0;
          });
        },
      );
    }
    if (_selectedIndex == 5) {
      return SchedulePage(
        schedules: _schedules,
        teachers: _teachers,
        language: widget.language,
        onBack: () {
          setState(() {
            _selectedIndex = 0;
          });
        },
      );
    }
    // Home (или другие вкладки)
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children:
                _getWeekDays().map((dayData) {
                  return _buildDayTile(
                    dayData['day'],
                    dayData['date'],
                    dayData['isSelected'],
                  );
                }).toList(),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedIndex = 1; // Teachers
                  });
                },
                child: _buildNavIcon(
                  Icons.person,
                  getLabel(context, 'teachers', widget.language),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedIndex = 2; // News
                  });
                },
                child: _buildNavIcon(
                  Icons.article,
                  getLabel(context, 'news', widget.language),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedIndex = 3; // Messages
                  });
                },
                child: _buildNavIcon(
                  Icons.message,
                  getLabel(context, 'messages', widget.language),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _customPage = 1;
                  });
                },
                child: _buildNavIcon(
                  Icons.schedule,
                  getLabel(context, 'schedule', widget.language),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedIndex = 4; // Settings
                  });
                },
                child: _buildNavIcon(
                  Icons.settings,
                  getLabel(context, 'settings', widget.language),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            getLabel(context, 'announcements', widget.language),
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: widget.news.length,
              itemBuilder: (context, index) {
                final news = widget.news[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: _buildAnnouncementTile(
                    news.month,
                    news.date,
                    news.title,
                    news.description,
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          Text(
            getLabel(context, 'recent_messages', widget.language),
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount:
                  widget.messages.length > 2 ? 2 : widget.messages.length,
              itemBuilder: (context, index) {
                final message = widget.messages[index];
                return _buildMessageTile(
                  message.sender,
                  message.text,
                  message.date,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  List<Map<String, dynamic>> _getWeekDays() {
    DateTime now = DateTime(2025, 5, 21);
    DateTime startOfWeek = now.subtract(Duration(days: now.weekday - 1));
    List<Map<String, dynamic>> weekDays = [];

    for (int i = 0; i < 7; i++) {
      DateTime day = startOfWeek.add(Duration(days: i));
      String dayName = ['MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN'][i];
      bool isSelected =
          day.day == now.day && day.month == now.month && day.year == now.year;
      weekDays.add({
        'day': dayName,
        'date': day.day.toString(),
        'isSelected': isSelected,
      });
    }

    return weekDays;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getLabel(context, 'home', widget.language)),
        centerTitle: true,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        elevation: 0,
        titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle,
        iconTheme: Theme.of(context).appBarTheme.iconTheme,
      ),
      body: _getBody(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onNavBarTap,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: getLabel(context, 'home', widget.language),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: getLabel(context, 'teachers', widget.language),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: getLabel(context, 'news', widget.language),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: getLabel(context, 'messages', widget.language),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: getLabel(context, 'settings', widget.language),
          ),
        ],
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
      ),
    );
  }

  Widget _buildDayTile(String day, String date, bool isSelected) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      children: [
        Text(
          day,
          style: TextStyle(
            fontSize: 12,
            color:
                isSelected
                    ? (isDark ? Colors.white : Colors.black)
                    : (isDark ? Colors.grey[400] : Colors.grey),
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        const SizedBox(height: 5),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isSelected ? Colors.blue : Colors.transparent,
          ),
          child: Text(
            date,
            style: TextStyle(
              fontSize: 16,
              color:
                  isSelected
                      ? Colors.white
                      : (isDark ? Colors.white : Colors.black),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNavIcon(IconData icon, String label) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.blue[900],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: Colors.white, size: 30),
        ),
        const SizedBox(height: 5),
        Text(
          label,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  Widget _buildAnnouncementTile(
    String month,
    String date,
    String title,
    String description,
  ) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child: Row(
        children: [
          Column(
            children: [
              Text(
                month,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                date,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  description,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageTile(String sender, String text, DateTime date) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(Icons.message, color: Colors.blue, size: 30),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  sender,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: isDark ? Colors.white : Colors.black,
                  ),
                ),
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 14,
                    color: isDark ? Colors.grey[300] : Colors.grey,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  DateFormat('MMM d, yyyy – HH:mm').format(date),
                  style: TextStyle(
                    fontSize: 12,
                    color: isDark ? Colors.grey[400] : Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ScheduleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Schedule Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SchedulePage(
        schedules: [],
        teachers: [],
        language:
            'Русский', // или 'English', если хочешь по-умолчанию английский
      ),
    );
  }
}

class SchedulePage extends StatefulWidget {
  final List<Schedule> schedules;
  final List<Teacher> teachers;
  final VoidCallback? onBack;
  final String language;

  const SchedulePage({
    Key? key,
    required this.schedules,
    required this.teachers,
    this.onBack,
    required this.language,
  }) : super(key: key);

  @override
  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  void _addSchedule() async {
    final newSchedule = await Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (context) => AddSchedulePage(
              teachers: widget.teachers,
              language: widget.language,
            ),
      ),
    );
    if (newSchedule != null && newSchedule is Schedule) {
      setState(() {
        widget.schedules.add(newSchedule);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Моё Расписание'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            if (widget.onBack != null) widget.onBack!();
          },
        ),
      ),
      body:
          widget.schedules.isEmpty
              ? const Center(child: Text('Нет расписаний'))
              : ListView.builder(
                itemCount: widget.schedules.length,
                itemBuilder: (context, index) {
                  final item = widget.schedules[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 16,
                    ),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${getLabel(context, 'teacher', widget.language)}: ${item.teacher}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            '${getLabel(context, 'subject', widget.language)}: ${item.subject}',
                            style: const TextStyle(fontSize: 15),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            '${getLabel(context, 'time', widget.language)}: ${item.time}',
                            style: const TextStyle(fontSize: 15),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            '${getLabel(context, 'room', widget.language)}: ${item.room}',
                            style: const TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addSchedule,
        child: const Icon(Icons.add),
        tooltip: 'Добавить расписание',
      ),
    );
  }
}

class AddSchedulePage extends StatefulWidget {
  final List<Teacher> teachers;
  final String language;
  const AddSchedulePage({
    Key? key,
    required this.teachers,
    required this.language,
  }) : super(key: key);

  @override
  _AddSchedulePageState createState() => _AddSchedulePageState();
}

class _AddSchedulePageState extends State<AddSchedulePage> {
  final _formKey = GlobalKey<FormState>();
  String subject = '';
  String? selectedTeacher;
  String time = '';
  String room = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Добавить расписание')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: getLabel(context, 'subject', widget.language),
                ),
                onSaved: (value) => subject = value ?? '',
              ),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: getLabel(context, 'teacher', widget.language),
                ),
                value: selectedTeacher,
                items:
                    widget.teachers
                        .map(
                          (t) => DropdownMenuItem(
                            value: t.name,
                            child: Text(t.name),
                          ),
                        )
                        .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedTeacher = value;
                  });
                },
                validator:
                    (value) => value == null ? 'Выберите преподавателя' : null,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: getLabel(context, 'time', widget.language),
                ),
                onSaved: (value) => time = value ?? '',
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: getLabel(context, 'room', widget.language),
                ),
                onSaved: (value) => room = value ?? '',
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                child: Text(getLabel(context, 'save', widget.language)),
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    _formKey.currentState?.save();
                    final newSchedule = Schedule(
                      subject: subject,
                      teacher: selectedTeacher ?? '',
                      time: time,
                      room: room,
                    );
                    Navigator.pop(context, newSchedule);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TeachersScreen extends StatefulWidget {
  final List<Teacher> teachers;
  final VoidCallback? onBack; // добавьте этот параметр
  final String language;

  const TeachersScreen({
    super.key,
    required this.teachers,
    this.onBack,
    required this.language,
  });

  @override
  State<TeachersScreen> createState() => _TeachersScreenState();
}

class _TeachersScreenState extends State<TeachersScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _gmailController = TextEditingController();
  final TextEditingController _infoController = TextEditingController();
  final TextEditingController _salaryController = TextEditingController();

  void _showTeacherDialog({Teacher? teacher, int? index}) {
    if (teacher != null) {
      _nameController.text = teacher.name;
      _phoneController.text = teacher.phone;
      _gmailController.text = teacher.gmail;
      _infoController.text = teacher.info;
      _salaryController.text = teacher.salary.toString();
    } else {
      _nameController.clear();
      _phoneController.clear();
      _gmailController.clear();
      _infoController.clear();
      _salaryController.clear();
    }

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            teacher == null
                ? getLabel(context, 'add_teacher', widget.language)
                : getLabel(context, 'edit_teacher', widget.language),
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: getLabel(context, 'name', widget.language),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _phoneController,
                  decoration: const InputDecoration(
                    labelText: 'Phone Number',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _gmailController,
                  decoration: const InputDecoration(
                    labelText: 'Gmail',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _infoController,
                  decoration: const InputDecoration(
                    labelText: 'Info',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _salaryController,
                  decoration: const InputDecoration(
                    labelText: 'Salary',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: Text(getLabel(context, 'cancel', widget.language)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text(
                teacher == null
                    ? getLabel(context, 'add', widget.language)
                    : getLabel(context, 'save', widget.language),
              ),
              onPressed: () {
                if (_nameController.text.isNotEmpty &&
                    _phoneController.text.isNotEmpty &&
                    _gmailController.text.isNotEmpty &&
                    _infoController.text.isNotEmpty &&
                    _salaryController.text.isNotEmpty) {
                  setState(() {
                    if (teacher == null) {
                      widget.teachers.add(
                        Teacher(
                          name: _nameController.text,
                          phone: _phoneController.text,
                          gmail: _gmailController.text,
                          info: _infoController.text,
                          salary: double.parse(_salaryController.text),
                        ),
                      );
                    } else {
                      widget.teachers[index!] = Teacher(
                        name: _nameController.text,
                        phone: _phoneController.text,
                        gmail: _gmailController.text,
                        info: _infoController.text,
                        salary: double.parse(_salaryController.text),
                      );
                    }
                  });
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getLabel(context, 'teachers', widget.language)),
        centerTitle: true,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        elevation: 0,
        titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle,
        iconTheme: Theme.of(context).appBarTheme.iconTheme,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Theme.of(context).appBarTheme.iconTheme?.color,
          ),
          onPressed: () {
            if (widget.onBack != null) {
              widget.onBack!();
            }
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child:
            widget.teachers.isEmpty
                ? Center(
                  child: Text(
                    getLabel(context, 'no_teachers', widget.language),
                  ),
                )
                : ListView.builder(
                  itemCount: widget.teachers.length,
                  itemBuilder: (context, index) {
                    final teacher = widget.teachers[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      child: ListTile(
                        leading: const Icon(Icons.person, color: Colors.blue),
                        title: Text(
                          teacher.name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Phone: ${teacher.phone}'),
                            Text('Gmail: ${teacher.gmail}'),
                            Text('Info: ${teacher.info}'),
                            Text('Salary: \$${teacher.salary}'),
                          ],
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.edit, color: Colors.blue),
                          onPressed: () {
                            _showTeacherDialog(teacher: teacher, index: index);
                          },
                        ),
                      ),
                    );
                  },
                ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showTeacherDialog(),
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _gmailController.dispose();
    _infoController.dispose();
    _salaryController.dispose();
    super.dispose();
  }
}

class NewsScreen extends StatefulWidget {
  final List<News> news;
  final VoidCallback? onBack;
  final String language;

  const NewsScreen({
    super.key,
    required this.news,
    this.onBack,
    required this.language,
  });

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  final TextEditingController _monthController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  void _showNewsDialog({News? news, int? index}) {
    if (news != null) {
      _monthController.text = news.month;
      _dateController.text = news.date;
      _titleController.text = news.title;
      _descriptionController.text = news.description;
    } else {
      _monthController.clear();
      _dateController.clear();
      _titleController.clear();
      _descriptionController.clear();
    }

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            news == null
                ? getLabel(context, 'add_news', widget.language)
                : getLabel(context, 'edit_news', widget.language),
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _monthController,
                  decoration: InputDecoration(
                    labelText: getLabel(context, 'month', widget.language),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _dateController,
                  decoration: InputDecoration(
                    labelText: getLabel(context, 'date', widget.language),
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _titleController,
                  decoration: InputDecoration(
                    labelText: getLabel(context, 'title', widget.language),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _descriptionController,
                  decoration: InputDecoration(
                    labelText: getLabel(
                      context,
                      'description',
                      widget.language,
                    ),
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 3,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(getLabel(context, 'cancel', widget.language)),
            ),
            TextButton(
              onPressed: () {
                if (_monthController.text.isNotEmpty &&
                    _dateController.text.isNotEmpty &&
                    _titleController.text.isNotEmpty &&
                    _descriptionController.text.isNotEmpty) {
                  setState(() {
                    if (news == null) {
                      widget.news.add(
                        News(
                          month: _monthController.text.toUpperCase(),
                          date: _dateController.text,
                          title: _titleController.text,
                          description: _descriptionController.text,
                        ),
                      );
                    } else {
                      widget.news[index!] = News(
                        month: _monthController.text.toUpperCase(),
                        date: _dateController.text,
                        title: _titleController.text,
                        description: _descriptionController.text,
                      );
                    }
                  });
                  Navigator.of(context).pop();
                }
              },
              child: Text(
                news == null
                    ? getLabel(context, 'add', widget.language)
                    : getLabel(context, 'save', widget.language),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News'),
        centerTitle: true,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        elevation: 0,
        titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle,
        iconTheme: Theme.of(context).appBarTheme.iconTheme,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Theme.of(context).appBarTheme.iconTheme?.color,
          ),
          onPressed: () {
            if (widget.onBack != null) {
              widget.onBack!(); // вызываем callback для смены вкладки
            }
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child:
            widget.news.isEmpty
                ? Center(
                  child: Text(getLabel(context, 'no_news', widget.language)),
                )
                : ListView.builder(
                  itemCount: widget.news.length,
                  itemBuilder: (context, index) {
                    final news = widget.news[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      child: ListTile(
                        leading: Column(
                          children: [
                            Text(
                              news.month,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              news.date,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        title: Text(
                          news.title,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        subtitle: Text(news.description),
                        trailing: IconButton(
                          icon: const Icon(Icons.edit, color: Colors.blue),
                          onPressed: () {
                            _showNewsDialog(news: news, index: index);
                          },
                        ),
                      ),
                    );
                  },
                ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showNewsDialog(),
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
    );
  }

  @override
  void dispose() {
    _monthController.dispose();
    _dateController.dispose();
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
}

class MessagesScreen extends StatefulWidget {
  final List<Message> messages;
  final VoidCallback? onBack;
  final String language;

  const MessagesScreen({
    super.key,
    required this.messages,
    this.onBack,
    required this.language,
  });

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  final TextEditingController _senderController = TextEditingController();
  final TextEditingController _textController = TextEditingController();

  void _showMessageDialog({Message? message, int? index}) {
    if (message != null) {
      _senderController.text = message.sender;
      _textController.text = message.text;
    } else {
      _senderController.clear();
      _textController.clear();
    }

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            message == null
                ? getLabel(context, 'add_message', widget.language)
                : getLabel(context, 'edit_message', widget.language),
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _senderController,
                  decoration: InputDecoration(
                    labelText: getLabel(context, 'sender', widget.language),
                    border: const OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _textController,
                  decoration: InputDecoration(
                    labelText: getLabel(context, 'message', widget.language),
                    border: const OutlineInputBorder(),
                  ),
                  maxLines: 3,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(getLabel(context, 'cancel', widget.language)),
            ),
            TextButton(
              onPressed: () {
                if (_senderController.text.isNotEmpty &&
                    _textController.text.isNotEmpty) {
                  setState(() {
                    if (message == null) {
                      widget.messages.add(
                        Message(
                          sender: _senderController.text,
                          text: _textController.text,
                          date: DateTime.now(),
                        ),
                      );
                    } else {
                      widget.messages[index!] = Message(
                        sender: _senderController.text,
                        text: _textController.text,
                        date: message.date,
                      );
                    }
                  });
                  Navigator.of(context).pop();
                }
              },
              child: Text(
                message == null
                    ? getLabel(context, 'add', widget.language)
                    : getLabel(context, 'save', widget.language),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Messages'),
        centerTitle: true,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        elevation: 0,
        titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle,
        iconTheme: Theme.of(context).appBarTheme.iconTheme,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Theme.of(context).appBarTheme.iconTheme?.color,
          ),
          onPressed: () {
            if (widget.onBack != null) {
              widget.onBack!(); // вызываем callback для смены вкладки
            }
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child:
            widget.messages.isEmpty
                ? Center(
                  child: Text(
                    getLabel(context, 'no_messages', widget.language),
                  ),
                )
                : ListView.builder(
                  itemCount: widget.messages.length,
                  itemBuilder: (context, index) {
                    final message = widget.messages[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      child: ListTile(
                        leading: const Icon(Icons.message, color: Colors.blue),
                        title: Text(
                          message.sender,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              message.text,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              DateFormat(
                                'MMM d, yyyy – HH:mm',
                              ).format(message.date),
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.edit, color: Colors.blue),
                          onPressed: () {
                            _showMessageDialog(message: message, index: index);
                          },
                        ),
                      ),
                    );
                  },
                ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showMessageDialog(),
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
    );
  }

  @override
  void dispose() {
    _senderController.dispose();
    _textController.dispose();
    super.dispose();
  }
}

class SettingsScreen extends StatelessWidget {
  final bool isDarkTheme;
  final String language;
  final ValueChanged<bool> onThemeChanged;
  final ValueChanged<String> onLanguageChanged;
  final VoidCallback? onBack;

  const SettingsScreen({
    super.key,
    required this.isDarkTheme,
    required this.language,
    required this.onThemeChanged,
    required this.onLanguageChanged,
    this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getLabel(context, 'settings', language)),
        centerTitle: true,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        elevation: 0,
        titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle,
        iconTheme: Theme.of(context).appBarTheme.iconTheme,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Theme.of(context).appBarTheme.iconTheme?.color,
          ),
          onPressed: () {
            if (onBack != null) onBack!();
          },
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.person),
            title: Text(getLabel(context, 'profile', language)),
            subtitle: const Text('admin@example.com'),
          ),
          SwitchListTile(
            secondary: const Icon(Icons.dark_mode),
            title: Text(getLabel(context, 'theme', language)),
            value: isDarkTheme,
            onChanged: onThemeChanged,
          ),
          ListTile(
            leading: const Icon(Icons.language),
            title: Text(getLabel(context, 'language', language)),
            subtitle: Text(language),
            onTap: () {
              showDialog(
                context: context,
                builder:
                    (context) => SimpleDialog(
                      title: Text(getLabel(context, 'language', language)),
                      children: [
                        SimpleDialogOption(
                          child: const Text('Русский'),
                          onPressed: () {
                            onLanguageChanged('Русский');
                            Navigator.pop(context);
                          },
                        ),
                        SimpleDialogOption(
                          child: const Text('English'),
                          onPressed: () {
                            onLanguageChanged('English');
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: Text(getLabel(context, 'about', language)),
            subtitle: Text(getLabel(context, 'version', language)),
            onTap: () {
              showAboutDialog(
                context: context,
                applicationName: 'Admin Panel',
                applicationVersion: '1.0.0',
                applicationLegalese: '© 2025 Your Company',
              );
            },
          ),
        ],
      ),
    );
  }
}
