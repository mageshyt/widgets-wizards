import 'package:flutter/material.dart';
import 'package:pagination_flutter/pagination.dart';

class CustomPagination extends StatefulWidget {
  final int numPages;
  final int pageVisible;
  final Function onPageChanged;
  const CustomPagination({
    super.key,
    required this.numPages,
    required this.pageVisible,
    required this.onPageChanged,
  });

  @override
  State<CustomPagination> createState() => _CustomPaginationState();
}

class _CustomPaginationState extends State<CustomPagination> {
  int selectedPage = 1;

  setSelectedPage(int index) {
    setState(() {
      selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Pagination(
            numOfPages: widget.numPages,
            selectedPage: selectedPage,
            pagesVisible: widget.pageVisible,
            spacing: 10,
            onPageChanged: (page) {
              widget.onPageChanged(page);
              setState(() {
                selectedPage = page;
              });
            },
            nextIcon: const Icon(
              Icons.arrow_forward_ios,
              size: 14,
            ),
            previousIcon: const Icon(
              Icons.arrow_back_ios,
              size: 14,
            ),
            activeTextStyle: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
            activeBtnStyle: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.black),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(38),
                ),
              ),
            ),
            inactiveBtnStyle: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(38),
              )),
            ),
            inactiveTextStyle: const TextStyle(
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
