import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sliding_toast/flutter_sliding_toast.dart';
import 'package:otp_text_field/style.dart';
import 'package:shimmer/shimmer.dart';
import 'package:widgets_wigets/widgets/alertdialog/alertdialog.dart';
import 'package:widgets_wigets/widgets/avatar/avatar.dart';
import 'package:widgets_wigets/widgets/button/button.dart';
import 'package:widgets_wigets/widgets/calender/calender.dart';
import 'package:widgets_wigets/widgets/card/cards.dart';
import 'package:widgets_wigets/widgets/carousal/carousal.dart';
import 'package:widgets_wigets/widgets/checkbox/checkbox.dart';
import 'package:widgets_wigets/widgets/otpfield/otpfield.dart';
import 'package:widgets_wigets/widgets/pagination/paginatoin.dart';
import 'package:widgets_wigets/widgets/snackbar/snackbar.dart';
import 'package:widgets_wigets/widgets/toast/toast.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Widgets Wizard 🔥'), actions: const [
        Avatar(
          path: 'https://avatars.githubusercontent.com/u/70838644?v=4',
          pathType: AvatarPathType.network,
          size: AvatarSizes.md,
          fallback: 'Magesh', // Fallback username
        ),
        SizedBox(
          width: 10,
        )
      ]),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Carousel(
              images: [
                'https://images.unsplash.com/photo-1605559424843-9e4c228bf1c2?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fGNhcnN8ZW58MHx8MHx8fDA%3D',
                'https://c.files.bbci.co.uk/F382/production/_123883326_852a3a31-69d7-4849-81c7-8087bf630251.jpg',
                'https://www.agendartecultura.com.br/wp-content/uploads/2021/08/Jujutsu-kaisen-divulga%C3%A7%C3%A3o-1024x576.jpg'
              ],
              indicatorType: CarouselIndicatorType.line,
              showButtons: false,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.all(8),
                  width: 180,
                  child: ShadcnButton(
                    text: 'Solid ',
                    onPressed: () => toast.showSuccessToast(
                      context: context,
                      title: 'Logined Successfully',
                    ),
                  ),
                ),
                Container(
                    width: 180,
                    margin: const EdgeInsets.all(8),
                    child: ShadcnButton(
                      variant: ButtonVariant.outline,
                      text: 'Default',
                      onPressed: () => toast.showCustomToast(
                        context: context,
                        customWidget: CustomCard(
                            header: CardHeader(
                              title: 'LOgin',
                            ),
                            content: const CardContent(children: [
                              TextField(
                                decoration: InputDecoration(
                                    hintText: 'Enter your email',
                                    labelText: 'Email',
                                    border: OutlineInputBorder()),
                              ),
                              SizedBox(height: 20),
                              TextField(
                                decoration: InputDecoration(
                                    hintText: 'Enter your password',
                                    labelText: 'Password',
                                    border: OutlineInputBorder()),
                              ),
                            ]),
                            footer: CardFooter(
                                customWidget: SizedBox(
                              width: double.infinity,
                              child: ShadcnButton(
                                text: 'Sign In',
                                onPressed: () => toast.showErrorToast(
                                  context: context,
                                  title: 'Something Went Wrong',
                                  toastAlignment: Alignment.bottomCenter,
                                ),
                              ),
                            ))),
                        bgcolor: Colors.black12,
                      ),
                    )),
              ],
            ),
            const SizedBox(height: 20),
            CheckBoxz(
              text: 'Terms and condiotions',
              isSelected: false,
              size: CheckBoxSize.md,
            ),
            Container(
              margin: const EdgeInsets.all(16),
              child: CustomCard(
                  // color: Colors.black12,
                  type: CardType.outlinedCard,
                  header: CardHeader(
                      // title: 'Sign in',
                      // subtitle: 'Sign in to continue',
                      // customWidget: Image.network(
                      //   'https://images.unsplash.com/photo-1605559424843-9e4c228bf1c2?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fGNhcnN8ZW58MHx8MHx8fDA%3D',
                      //   width: double.infinity,
                      //   fit: BoxFit.cover,
                      //   // width: double.infinity,
                      // ),

                      customWidget: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      'https://c.files.bbci.co.uk/F382/production/_123883326_852a3a31-69d7-4849-81c7-8087bf630251.jpg',
                      fit: BoxFit.cover,
                    ),
                  )),
                  content: const CardContent(
                    children: [
                      // TextField(
                      //   decoration: InputDecoration(
                      //       hintText: 'Enter your email',
                      //       labelText: 'Email',
                      //       border: OutlineInputBorder()),
                      // ),
                      // SizedBox(height: 20),
                      // TextField(
                      //   decoration: InputDecoration(
                      //       hintText: 'Enter your password',
                      //       labelText: 'Password',
                      //       border: OutlineInputBorder()),
                      // ),
                    ],
                  ),
                  footer: CardFooter(
                      customWidget: SizedBox(
                    width: double.infinity,
                    child: ShadcnButton(
                        text: 'Sign In',
                        onPressed: () => snackbar.showSnackbar(
                            context: context,
                            title: 'Heyy!!!',
                            message: 'laskdflkj sdfkjbsd sldajkb sdafjb sdf,jb',
                            contentType: ContentType.success)),
                  ))),
            ),
            // Container(
            //   width: 300,
            //   child: OTPField(
            //     length: 6,
            //     style: FieldStyle.box,
            //   ),
            // )
            Container(
              // margin: EdgeInsets.all(20),
              width: double.infinity,
              height: 200,
              child: MyHomePage(
                numPages: 10,
                pageVisible: 5,
                onPageChanged: (page) {
                  print('page changed' + page.toString());
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
