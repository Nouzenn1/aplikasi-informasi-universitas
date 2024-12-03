import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../models/university.dart';
import '../widgets/university_card_with_image.dart'; // Import widget dengan gambar

class BerandaPage extends StatelessWidget {
  const BerandaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://media.istockphoto.com/id/1438969575/id/foto/mahasiswa-laki-laki-muda-yang-tersenyum-mengenakan-headphone-berdiri-di-ruang-kelas.jpg?s=612x612&w=0&k=20&c=utITD7BW_lgtGpeIFVNmCMpPXFg_zlSdVM4aqbuTdv4='),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello, Student!',
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 16),
              InkWell(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.lightBlue,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      SvgPicture.network('https://th.bing.com/th/id/OIP.bO8UK4fn7IUQ9Ow2cETZzAHaHa?rs=1&pid=ImgDetMain', height: 100),
                      const SizedBox(width: 16),
                      Text(
                        'Ayo Kuliah',
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Cari Universitas',
                  prefixIcon: Icon(MdiIcons.magnify),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Negara',
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CountryIcon(
                    iconData: MdiIcons.flagVariant,
                    label: 'United States',
                    onTap: () {
                      Navigator.pushNamed(context, '/country', arguments: 'United States');
                    },
                  ),
                  CountryIcon(
                    iconData: MdiIcons.flagVariant,
                    label: 'United Kingdom',
                    onTap: () {
                      Navigator.pushNamed(context, '/country', arguments: 'United Kingdom');
                    },
                  ),
                  CountryIcon(
                    iconData: MdiIcons.flagVariant,
                    label: 'France',
                    onTap: () {
                      Navigator.pushNamed(context, '/country', arguments: 'France');
                    },
                  ),
                  CountryIcon(
                    iconData: MdiIcons.flagVariant,
                    label: 'Japan',
                    onTap: () {
                      Navigator.pushNamed(context, '/country', arguments: 'Japan');
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                'Rekomendasi Universitas',
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 8),
              // Tambahkan beberapa kartu universitas contoh dengan gambar
              UniversityCardWithImage(university: University(
                name: 'Massachusetts Institute of Technology (MIT)',
                country: 'USA',
                domains: ['mit.edu'],
                webPages: ['https://www.mit.edu/'],
                alphaTwoCode: 'US',
                imageUrl: 'https://th.bing.com/th/id/OIP.QnP43wMUPOGPU2EJhj-yFAAAAA?rs=1&pid=ImgDetMain',
              )),
              UniversityCardWithImage(university: University(
                name: 'University of Cambridge',
                country: 'UK',
                domains: ['cam.ac.uk'],
                webPages: ['https://www.cam.ac.uk/'],
                alphaTwoCode: 'UK',
                imageUrl: 'https://th.bing.com/th/id/OIP.8tBuHUS0AzXOnucddc1PoQHaE7?w=800&h=533&rs=1&pid=ImgDetMain',
              )),
              UniversityCardWithImage(university: University(
                name: 'Université de Lorraine',
                country: 'France',
                domains: ['lorraine.fr'],
                webPages: ['https://www.univ-lorraine.fr/'],
                alphaTwoCode: 'FR',
                imageUrl: 'https://th.bing.com/th/id/OIP.FC-l_r-Dg6Q8teyxlgfUPAHaDF?w=295&h=145&c=7&r=0&o=5&dpr=1.3&pid=1.7',
              )),
              UniversityCardWithImage(university: University(
                name: 'The University of Tokyo',
                country: 'Japan',
                domains: ['tokyo.ac.jp'],
                webPages: ['https://www.u-tokyo.ac.jp/en/'],
                alphaTwoCode: 'JP',
                imageUrl: 'https://i1.wp.com/myschoolscholarships.org/wp-content/uploads/2018/03/University-Of-Tokyo.jpg?fit=870%2C581&ssl=1',
              )),
            ],
          ),
        ),
      ),
    );
  }
}

class CountryIcon extends StatelessWidget {
  final IconData iconData;
  final String label;
  final VoidCallback onTap;

  const CountryIcon({super.key, required this.iconData, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            child: Icon(iconData, size: 30),
          ),
          const SizedBox(height: 8),
          Text(label, style: GoogleFonts.poppins()),
        ],
      ),
    );
  }
}
