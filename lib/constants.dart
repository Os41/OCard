import 'package:flutter/material.dart';

// Page names
const more = 'More';
const profileInformation = 'Profile information';
const myQrCode = 'My QR code';
const cashback = 'Cashback';
const inviteFriend = 'Invite friend';
const helpAndSupport = 'Help & support';
const aboutOneCard = 'About one card';
const termsAndConditions = 'Terms & conditions';
const privacyPolicy = 'Privacy policy';
const logOut = 'Logout';

// Colors
const secondaryColor = 0xFF211E1E;
const successLabelColor = 0xFF4DBFA3;
const successLabelBackgroundColor = 0xFF49BDA1;
const dangerLabelColor = 0xFFF02C2C;
const dangerLabelBackgroundColor = 0xFFF02C2C;
const warningLabelColor = 0xFFEBB228;
const warningLabelBackgroundColor = 0xFFEAB32C;
const gBlack = 0xFF2A2826;
const black = 0xFF111111;
const white = 0xFFF5F5F5;
const gray = 0xFF505050;
const lightPurple = 0xFFE3C8FC;
const darkPurple = 0xFF4D227C;
const lightGreen = 0xFFB5EED4;
const green = 0xFF3DD0BE;
const darkGreen = 0xFF057742;
const lightBlue = 0xFFD3F5FE;
const blue = 0xFF7FB2C0;
const darkBlue = 0xFF226479;
const lightBrown = 0xFFFDC2AF;
const brown = 0xFFBF7D6A;
const darkBrown = 0xFF69240F;
const seaBlue = 0xFFD2F6F5;
const hRed = 0xFFC13A5B;
const hGreen = 0xFF5FDEB4;
const bGreen = 0xFFB4B1F6553;
const lGreen = 0xFFB4B1F650;
const purple = 0xFF60269D;
const pBlue = 0xFF2664FA;
const bOrange = 0xFFFF7955;
const blueLC = 0xFF0B03FA;
const redLC = 0xFFC90031;
const purpleLC = 0xFF8E00D2;
const darkRedLC = 0xFF640018;
const Texthintcolor = 0xFF3F3F3F;
const Textcolor = 0xFF211E1E;
const whiteColor = 0xFFFFFFFF;
const buttonColor = 0xFF1E1B1B;



const List categories = [
  {
    'label': 'Food',
    'icon': Icons.fastfood_rounded,
    'key': 'food'
  },
  {
    'label': 'Drinks',
    'icon': Icons.local_drink_rounded,
    'key': 'drinks'
  },
  {
    'label': 'Groceries',
    'icon': Icons.shopping_cart_rounded,
    'key': 'groceries'
  },
  {
    'label': 'Transportation',
    'icon': Icons.emoji_transportation_rounded,
    'key': 'transportation'
  },
  {
    'label': 'Entertainment',
    'icon': Icons.import_contacts_sharp,
    'key': 'entertainment'
  },
  {
    'label': 'Education',
    'icon': Icons.school_rounded,
    'key': 'education'
  },
  {
    'label': 'Health',
    'icon': Icons.healing_rounded,
    'key': 'health'
  },
  {
    'label': 'Shopping',
    'icon': Icons.shopping_bag_rounded,
    'key': 'shopping'
  },
  {
    'label': 'Home',
    'icon': Icons.home_rounded,
    'key': 'home'
  },
  {
    'label': 'Utilities',
    'icon': Icons.import_contacts_sharp,
    'key': 'utilities'
  },
  {
    'label': 'In app purchases',
    'icon': Icons.app_shortcut_rounded,
    'key': 'in_app_purchases'
  },
  {
    'label': 'Financial',
    'icon': Icons.attach_money_rounded,
    'key': 'financial'
  },
  {
    'label': 'Charitable',
    'icon': Icons.import_contacts_sharp,
    'key': 'charitable'
  },
  {
    'label': 'Gifts',
    'icon': Icons.card_giftcard_rounded,
    'key': 'gifts'
  },
  {
    'label': 'Taxes',
    'icon': Icons.currency_exchange_rounded,
    'key': 'taxes'
  },
  {
    'label': 'Miscellaneous',
    'icon': Icons.import_contacts_sharp,
    'key': 'miscellaneous'
  }
];

// User
const Map sourceOfIncome = {
 'REAL_ESTATE': 'real estate',
 'RENTAL_INCOME': 'rental income',
 'SALARY': 'salary',
 'INVESTMENT_RETURNS': 'investment returns',
 'ANCESTRAL': 'ancestral',
 'OTHER': 'other'
};
const Map employmentStatus = {
  'MILITARY': 'military',
  'RETIRED': 'retired',
  'HOME_MAKER': 'home maker',
  'UNEMPLOYED': 'unemployed',
  'STUDENT': 'student',
  'SELF_EMPLOYED': 'self employed',
  'GOVERNMENT_SECTOR': 'government sector',
  'HOUSEHOLD_LABOR': 'household labor',
  'PRIVATE_SECTOR': 'private sector',
  'OTHER': 'other'
};
const Map incomeRange = {
  'BELOW_LOW': '2,000 SAR and below',
  'LOW': '2,000 SAR and 5,000 SAR',
  'MID_LOW': '5,000 SAR and 10,000 SAR',
  'MID': '10,000 SAR and 20,000 SAR',
  'MID_HIGH': '20,000 SAR and 40,000 SAR',
  'HIGH': '40,000 SAR and 60,000 SAR',
  'ABOVE_HIGH': '60,000 SAR and above',
};
const List shieldsList = [
  {
    'label': 'No type selected',
    'image': 'Add-shield.png',
    'color': hRed
  },
  {
    'label': 'Category Activate',
    'image': 'Category-shield.png',
    'color': purple
  },
  {
    'label': 'Percentage Activate',
    'image': 'Percentage-shield.png',
    'color': pBlue
  },
  {
    'label': 'Priority Activate',
    'image': 'Priority-shield.png',
    'color': lGreen
  }
];


