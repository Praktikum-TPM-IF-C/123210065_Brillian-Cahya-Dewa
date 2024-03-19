void main() {
  for (int i = 0; i < 10; i++) {
    print('hello ${i + 1}');
  }
}

class Member {
  final String name;
  final String dateOfBirth;
  final String bloodType;
  final String horoscope;
  final double bodyHeight;
  final String nickname;
  final String photoUrl;
  final String type;

  Member(
      {required this.name,
      required this.dateOfBirth,
      required this.bloodType,
      required this.horoscope,
      required this.bodyHeight,
      required this.nickname,
      required this.photoUrl,
      required this.type});
}


    List<Member> members = [
    Member(
        name: "Amanda Sukma",
        dateOfBirth: "17 Desember 2004",
        bloodType: "O",
        horoscope: "Sagitarius",
        bodyHeight: 160,
        nickname: "Amanda",
        photoUrl: "https://jkt48.com/profile/amanda_sukma.jpg",
        type: "Member"),

    Member(
        name: "Angelina Christy",
        dateOfBirth: "5 Desember 2005",
        bloodType: "O",
        horoscope: "Sagitarius",
        bodyHeight: 163,
        nickname: "Christy",
        photoUrl: "https://jkt48.com/profile/angelina_christy.jpg",
        type: "Member"),

    Member(
        name: "Aurellia",
        dateOfBirth: "29 Oktober 2002",
        bloodType: "O",
        horoscope: "Scorpio",
        bodyHeight: 155,
        nickname: "Lia",
        photoUrl: "https://jkt48.com/profile/aurellia.jpg",
        type: "Member"),

    Member(
        name: "Azizi Asadel",
        dateOfBirth: "16 Mei 2004",
        bloodType: "O",
        horoscope: "Taurus",
        bodyHeight: 162,
        nickname: "Zee",
        photoUrl: "https://jkt48.com/profile/azizi_asadel.jpg",
        type: "Member"),

    Member(
        name: "Callista Alifia",
        dateOfBirth: "8 Agustus 2005",
        bloodType: "O",
        horoscope: "Leo",
        bodyHeight: 157,
        nickname: "Callie",
        photoUrl: "https://jkt48.com/profile/callista_alifia.jpg",
        type: "Member"),

    Member(
        name: "Cornelia Vanisa",
        dateOfBirth: "26 Juli 2002",
        bloodType: "O",
        horoscope: "Leo",
        bodyHeight: 162,
        nickname: "Oniel",
        photoUrl: "https://jkt48.com/profile/cornelia_vanisa.jpg?",
        type: "Member"),

    Member(
        name: "Febriola Sinambela",
        dateOfBirth: "26 Februari 2005",
        bloodType: "B",
        horoscope: "Pisces",
        bodyHeight: 154,
        nickname: "Olla",
        photoUrl: "https://jkt48.com/profile/febriola_sinambela.jpg",
        type: "Member"),

    Member(
        name: "Feni Fitriyanti",
        dateOfBirth: "16 Januari 1999",
        bloodType: "O",
        horoscope: "Capricorn",
        bodyHeight: 162,
        nickname: "Feni",
        photoUrl: "https://jkt48.com/profile/feni_fitriyanti.jpg",
        type: "Member"),

    Member(
        name: "Fiony Alveria",
        dateOfBirth: "4 Februari 2002",
        bloodType: "O",
        horoscope: "Aquarius",
        bodyHeight: 158,
        nickname: "Fiony",
        photoUrl: "https://jkt48.com/profile/fiony_alveria.jpg",
        type: "Member"),

    Member(
        name: "Flora Shafiq",
        dateOfBirth: "4 April 2005",
        bloodType: "B",
        horoscope: "Aries",
        bodyHeight: 149,
        nickname: "Flora",
        photoUrl: "https://jkt48.com/profile/flora_shafiq.jpg",
        type: "Member"),

    Member(
        name: "Freya Jayawardana",
        dateOfBirth: "13 Februari 2006",
        bloodType: "B",
        horoscope: "Aquarius",
        bodyHeight: 154,
        nickname: "Freya",
        photoUrl: "https://jkt48.com/profile/freya_jayawardana.jpg",
        type: "Member"),

    Member(
        name: "Gabriela Abigail",
        dateOfBirth: "7 Agustus 2006",
        bloodType: "B",
        horoscope: "Leo",
        bodyHeight: 160,
        nickname: "Ella",
        photoUrl: "https://jkt48.com/profile/gabriela_abigail.jpg?v=20230531",
        type: "Member"),

    Member(
        name: "Gita Sekar Andarini",
        dateOfBirth: "30 Juni 2001",
        bloodType: "O",
        horoscope: "Cancer",
        bodyHeight: 165,
        nickname: "Gita",
        photoUrl:
            "https://jkt48.com/profile/gita_sekar_andarini.jpg?v=20230116",
        type: "Member"),

    Member(
        name: "Grace Octaviani",
        dateOfBirth: "18 Oktober 2007",
        bloodType: "B",
        horoscope: "Libra",
        bodyHeight: 165,
        nickname: "Gracie",
        photoUrl: "https://jkt48.com/profile/grace_octaviani.jpg?v=20231212",
        type: "Member"),

    Member(
        name: "Greesella Adhalia",
        dateOfBirth: "10 Januari 2006",
        bloodType: "O",
        horoscope: "Capricorn",
        bodyHeight: 165,
        nickname: "Greesel",
        photoUrl: "https://jkt48.com/profile/greesella_adhalia.jpg?v=20231212",
        type: "Member"),

    Member(
        name: "Helisma Putri",
        dateOfBirth: "15 Juni 2000",
        bloodType: "A",
        horoscope: "Gemini",
        bodyHeight: 165,
        nickname: "Eli",
        photoUrl: "https://jkt48.com/profile/helisma_putri.jpg?v=20230116",
        type: "Member"),

    Member(
        name: "Indira Seruni",
        dateOfBirth: "26 April 2004",
        bloodType: "A",
        horoscope: "Taurus",
        bodyHeight: 160,
        nickname: "Indira",
        photoUrl: "https://jkt48.com/profile/indira_seruni.jpg?v=20230531",
        type: "Member"),

    Member(
        name: "Indah Cahya",
        dateOfBirth: "20 Maret 2001",
        bloodType: "A",
        horoscope: "Pisces",
        bodyHeight: 165,
        nickname: "Indah",
        photoUrl: "https://jkt48.com/profile/indah_cahya.jpg?v=20230116",
        type: "Member"),

    Member(
        name: "Jessica Chandra",
        dateOfBirth: "23 September 2005",
        bloodType: "O",
        horoscope: "Libra",
        bodyHeight: 163,
        nickname: "Jessi",
        photoUrl: "https://jkt48.com/profile/jessica_chandra.jpg?v=20230116",
        type: "Member"),

    Member(
        name: "Jesslyn Elly",
        dateOfBirth: "13 September 2001",
        bloodType: "O",
        horoscope: "Virgo",
        bodyHeight: 155,
        nickname: "Lyn",
        photoUrl: "https://jkt48.com/profile/jesslyn_elly.jpg?v=20230531",
        type: "Member"),

    Member(
        name: "Kathrina Irene",
        dateOfBirth: "26 Juli 2006",
        bloodType: "A",
        horoscope: "Leo",
        bodyHeight: 165,
        nickname: "Kathrina",
        photoUrl: "https://jkt48.com/profile/kathrina_irene.jpg?v=20230116",
        type: "Member"),

    Member(
        name: "Lulu Salsabila",
        dateOfBirth: "23 Oktober 2002",
        bloodType: "B",
        horoscope: "Scorpio",
        bodyHeight: 157,
        nickname: "Lulu",
        photoUrl: "https://jkt48.com/profile/lulu_salsabila.jpg?v=20230116",
        type: "Member"),

    Member(
        name: "Marsha Lenathea",
        dateOfBirth: "9 Januari 2006",
        bloodType: "O",
        horoscope: "Capricorn",
        bodyHeight: 163,
        nickname: "Marsha",
        photoUrl: "https://jkt48.com/profile/marsha_lenathea.jpg?v=20230116",
        type: "Member"),

    Member(
        name: "Mutiara Azzahra",
        dateOfBirth: "12 Juli 2004",
        bloodType: "B",
        horoscope: "Cancer",
        bodyHeight: 158,
        nickname: "Muthe",
        photoUrl: "https://jkt48.com/profile/mutiara_azzahra.jpg?v=20230116",
        type: "Member"),

    Member(
        name: "Raisha Syifa",
        dateOfBirth: "11 November 2007",
        bloodType: "AB",
        horoscope: "Scorpio",
        bodyHeight: 163,
        nickname: "Raisha",
        photoUrl: "https://jkt48.com/profile/raisha_syifa.jpg?v=20230530",
        type: "Member"),

    Member(
        name: "Reva Fidela",
        dateOfBirth: "14 Juli 2006",
        bloodType: "A",
        horoscope: "Cancer",
        bodyHeight: 159,
        nickname: "Adel",
        photoUrl: "https://jkt48.com/profile/reva_fidela.jpg?v=20230116",
        type: "Member"),

    Member(
        name: "Shani Indira Natio",
        dateOfBirth: "5 Oktober 1998",
        bloodType: "B",
        horoscope: "Libra",
        bodyHeight: 167,
        nickname: "Shani",
        photoUrl: "https://jkt48.com/profile/shani_indira_natio.jpg?v=20230116",
        type: "Member"),

    Member(
        name: "Shania Gracia",
        dateOfBirth: "31 Agustus 1999",
        bloodType: "A",
        horoscope: "Virgo",
        bodyHeight: 161,
        nickname: "Gracia",
        photoUrl: "https://jkt48.com/profile/shania_gracia.jpg?v=20230116",
        type: "Member"),
    //-------------------------------------------

    Member(
        name: "Abigail Rachel",
        dateOfBirth: "6 Agustus 2008",
        bloodType: "B",
        horoscope: "Leo",
        bodyHeight: 161,
        nickname: "Aralie",
        photoUrl: "https://jkt48.com/profile/abigail_rachel.jpg",
        type: "Trainee"),

    Member(
        name: "Adeline Wijaya",
        dateOfBirth: "1 September 2007",
        bloodType: "B",
        horoscope: "Virgo",
        bodyHeight: 167,
        nickname: "Delyn",
        photoUrl: "https://jkt48.com/profile/adeline_wijaya.jpg",
        type: "Trainee"),

    Member(
        name: "Aisa Maharani",
        dateOfBirth: "31 Januari 2006",
        bloodType: "B",
        horoscope: "Aquarius",
        bodyHeight: 162,
        nickname: "Shasa",
        photoUrl: "https://jkt48.com/profile/aisa_maharani.jpg",
        type: "Trainee"),

    Member(
        name: "Alya Amanda",
        dateOfBirth: "26 Agustus 2006",
        bloodType: "A",
        horoscope: "Virgo",
        bodyHeight: 165,
        nickname: "Alya",
        photoUrl: "https://jkt48.com/profile/alya_amanda.jpg?v=20231212",
        type: "Trainee"),

    Member(
        name: "Anindya Ramadhani",
        dateOfBirth: "18 Oktober 2005",
        bloodType: "O",
        horoscope: "Libra",
        bodyHeight: 154,
        nickname: "Anindya",
        photoUrl: "https://jkt48.com/profile/anindya_ramadhani.jpg?v=20231212",
        type: "Trainee"),

    Member(
        name: "Aurhel Alana",
        dateOfBirth: "14 September 2006",
        bloodType: "-",
        horoscope: "Virgo",
        bodyHeight: 163,
        nickname: "Lana",
        photoUrl: "https://jkt48.com/profile/aurhel_alana.jpg?v=20231212",
        type: "Trainee"),

    Member(
        name: "Catherina Vallencia",
        dateOfBirth: "21 Agustus 2007",
        bloodType: "B",
        horoscope: "Leo",
        bodyHeight: 163,
        nickname: "Erine",
        photoUrl: "https://jkt48.com/profile/catherina_vallencia.jpg",
        type: "Trainee"),

    Member(
        name: "Cathleen Nixie",
        dateOfBirth: "28 Mei 2009",
        bloodType: "A",
        horoscope: "Gemini",
        bodyHeight: 158,
        nickname: "Cathy",
        photoUrl: "https://jkt48.com/profile/cathleen_nixie.jpg?v=20231212",
        type: "Trainee"),

    Member(
        name: "Celline Thefani",
        dateOfBirth: "9 April 2007",
        bloodType: "O",
        horoscope: "Aries",
        bodyHeight: 163,
        nickname: "Elin",
        photoUrl: "https://jkt48.com/profile/celline_thefani.jpg?v=20231212",
        type: "Trainee"),

    Member(
        name: "Chelsea Davina",
        dateOfBirth: "23 Desember 2009",
        bloodType: "B",
        horoscope: "Capricorn",
        bodyHeight: 168,
        nickname: "Chelsea",
        photoUrl: "https://jkt48.com/profile/chelsea_davina.jpg?v=20231212",
        type: "Trainee"),

    Member(
        name: "Cynthia Yaputera",
        dateOfBirth: "22 November 2003",
        bloodType: "O",
        horoscope: "Sagitarius",
        bodyHeight: 158,
        nickname: "Cynthia",
        photoUrl: "https://jkt48.com/profile/cynthia_yaputera.jpg?v=20231212",
        type: "Trainee"),

    Member(
        name: "Dena Natalia",
        dateOfBirth: "16 Desember 2005",
        bloodType: "O",
        horoscope: "Sagitarius",
        bodyHeight: 162,
        nickname: "Danella",
        photoUrl: "https://jkt48.com/profile/dena_natalia.jpg?v=20231212",
        type: "Trainee"),

    Member(
        name: "Desy Natalia",
        dateOfBirth: "16 Desember 2005",
        bloodType: "O",
        horoscope: "Sagitarius",
        bodyHeight: 165,
        nickname: "Daisy",
        photoUrl: "https://jkt48.com/profile/desy_natalia.jpg?v=20231212",
        type: "Trainee"),

    Member(
        name: "Fritzy Rosmerian",
        dateOfBirth: "28 Juli 2008",
        bloodType: "A",
        horoscope: "Leo",
        bodyHeight: 157,
        nickname: "Fritzy",
        photoUrl: "https://jkt48.com/profile/fritzy_rosmerian.jpg",
        type: "Trainee"),

    Member(
        name: "Gendis Mayrannisa",
        dateOfBirth: "23 Juni 2010",
        bloodType: "B",
        horoscope: "Cancer",
        bodyHeight: 160,
        nickname: "Gendis",
        photoUrl: "https://jkt48.com/profile/gendis_mayrannisa.jpg?v=20231212",
        type: "Trainee"),

    Member(
        name: "Hillary Abigail",
        dateOfBirth: "19 Oktober 2007",
        bloodType: "O",
        horoscope: "Libra",
        bodyHeight: 160,
        nickname: "Lily",
        photoUrl: "https://jkt48.com/profile/hillary_abigail.jpg",
        type: "Trainee"),

    Member(
        name: "Jazzlyn Trisha",
        dateOfBirth: "16 Februari 2011",
        bloodType: "O",
        horoscope: "Aquarius",
        bodyHeight: 164,
        nickname: "Trisha",
        photoUrl: "https://jkt48.com/profile/jazzlyn_trisha.jpg",
        type: "Trainee"),

    Member(
        name: "Jeane Victoria",
        dateOfBirth: "5 Juni 2006",
        bloodType: "O",
        horoscope: "Gemini",
        bodyHeight: 164,
        nickname: "Jeane",
        photoUrl: "https://jkt48.com/profile/jeane_victoria.jpg?v=20231212",
        type: "Trainee"),

    Member(
        name: "Michelle Levia",
        dateOfBirth: "24 Januari 2009",
        bloodType: "O",
        horoscope: "Aquarius",
        bodyHeight: 168,
        nickname: "Levi",
        photoUrl: "https://jkt48.com/profile/michelle_levia.jpg",
        type: "Trainee"),

    Member(
        name: "Michelle Alexandra",
        dateOfBirth: "22 April 2009",
        bloodType: "O",
        horoscope: "Taurus",
        bodyHeight: 160,
        nickname: "Michie",
        photoUrl: "https://jkt48.com/profile/michelle_alexandra.jpg?v=20231212",
        type: "Trainee"),

    Member(
        name: "Letycia Moreen",
        dateOfBirth: "7 Juni 2010",
        bloodType: "O",
        horoscope: "Gemini",
        bodyHeight: 160,
        nickname: "Moreen",
        photoUrl: "https://jkt48.com/profile/letycia_moreen.jpg?v=20231212",
        type: "Trainee"),

    Member(
        name: "Nayla Suji",
        dateOfBirth: "18 Juni 2007",
        bloodType: "AB",
        horoscope: "Gemini",
        bodyHeight: 161,
        nickname: "Nayla",
        photoUrl: "https://jkt48.com/profile/nayla_suji.jpg",
        type: "Trainee"),

    Member(
        name: "Nina Tutachia",
        dateOfBirth: "16 Oktober 2009",
        bloodType: "O",
        horoscope: "Libra",
        bodyHeight: 162,
        nickname: "Nachia",
        photoUrl: "https://jkt48.com/profile/nina_tutachia.jpg?v=20231212",
        type: "Trainee"),

    Member(
        name: "Oline Manuel",
        dateOfBirth: "3 November 2007",
        bloodType: "B",
        horoscope: "Scorpio",
        bodyHeight: 167,
        nickname: "Oline",
        photoUrl: "https://jkt48.com/profile/oline_manuel.jpg",
        type: "Trainee"),

    Member(
        name: "Regina Wilian",
        dateOfBirth: "10 Desember 2009",
        bloodType: "B",
        horoscope: "Sagitarius",
        bodyHeight: 169,
        nickname: "Regie",
        photoUrl: "https://jkt48.com/profile/regina_wilian.jpg",
        type: "Trainee"),

    Member(
        name: "Ribka Budiman",
        dateOfBirth: "13 Januari 2009",
        bloodType: "O",
        horoscope: "Capricorn",
        bodyHeight: 163,
        nickname: "Ribka",
        photoUrl: "https://jkt48.com/profile/ribka_budiman.jpg",
        type: "Trainee"),

    Member(
        name: "Shabilqis Naila",
        dateOfBirth: "1 September 2008",
        bloodType: "B",
        horoscope: "Virgo",
        bodyHeight: 160,
        nickname: "Nala",
        photoUrl: "https://jkt48.com/profile/shabilqis_naila.jpg",
        type: "Trainee"),

    Member(
        name: "Victoria Kimberly",
        dateOfBirth: "8 Maret 2010",
        bloodType: "AB",
        horoscope: "Pisces",
        bodyHeight: 158,
        nickname: "Kimmy",
        photoUrl: "https://jkt48.com/profile/victoria_kimberly.jpg",
        type: "Trainee"),
];

 
