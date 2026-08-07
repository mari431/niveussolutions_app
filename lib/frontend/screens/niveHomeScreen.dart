import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/auth_controller.dart';
import '../../controller/themeController.dart';
import '../constance/globe_colors.dart';
import 'globe_drawer.dart';

class NiveHomeScreen1 extends StatelessWidget {
  NiveHomeScreen1({
    super.key,
  });

  // final AuthController ctrl = Get.find();
  final ThemeController _themeFindController = Get.put(ThemeController());
  final AuthController _authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenWidth = screenSize.width;
    final double screenHeight = screenSize.height;

    return SafeArea(
      child: Scaffold(
          // backgroundColor: GlobeAppColors.getBodyBGColor(_themeFindController.isDarkMode),
        backgroundColor: Colors.transparent,
          appBar: AppBar(title: Text('Niveus Solutions Home'),),
          drawer: globe_drawer(),
          body: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              
              child: SizedBox(
                width: MediaQuery.of(context).size.width < 600
                    ? 650
                    : MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Container(
                      // height: screenHeight -5,
                      child: Obx(() {
                        switch (_authController.apiStatus.value) {
                          case ApiStatus.loading:
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                
                          case ApiStatus.empty:
                            return const Center(
                              child: Text(
                                "No data found",
                                style: TextStyle(fontSize: 16),
                              ),
                            );
                
                          case ApiStatus.error:
                            return Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    _authController.errorMessage.value,
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(height: 10),
                                  ElevatedButton(
                                    onPressed: () {
                                      _authController.getAllDataSet();
                                    },
                                    child: const Text("Retry"),
                                  ),
                                ],
                              ),
                            );
                
                          case ApiStatus.success:
                            return Container(
                              // height: 500,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                
                                  Container(
                                    width: 250,
                                    child: TextField(
                                      controller: _authController.searchController,
                                      decoration: InputDecoration(
                                        hintText: "Search by Name or ID",
                                        prefixIcon: const Icon(Icons.search),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                
                                        suffixIcon:
                                           _authController.searchController.text.isEmpty
                                              ? const SizedBox.shrink()
                                              : IconButton(
                                            icon: const Icon(Icons.clear),
                                            onPressed: () {
                                              _authController.searchController.clear();
                                              _authController.searchUser("");
                                            },
                                          ),
                
                                        // suffixIcon: Obx(() {
                                        //   return _authController.searchController.text.isEmpty
                                        //       ? const SizedBox.shrink()
                                        //       : IconButton(
                                        //     icon: const Icon(Icons.clear),
                                        //     onPressed: () {
                                        //       _authController.searchController.clear();
                                        //       _authController.searchUser("");
                                        //     },
                                        //   );
                                        // }),
                                      ),
                                      onChanged: _authController.searchUser,
                                    ),
                                  ),
                
                                  Obx(() {
                                    return DropdownSearch<String>(
                                      items: (filter, _) => _authController.languageList,
                
                                      selectedItem: _authController.selectedLanguage.value,
                
                                      decoratorProps: const DropDownDecoratorProps(
                                        decoration: InputDecoration(
                                          labelText: "Language",
                                          border: OutlineInputBorder(),
                                        ),
                                      ),
                
                                      popupProps: PopupProps.menu(
                                        showSearchBox: true,
                
                                        searchFieldProps: const TextFieldProps(
                                          decoration: InputDecoration(
                                            hintText: "Search language",
                                            prefixIcon: Icon(Icons.search),
                                          ),
                                        ),
                
                                        emptyBuilder: (context, searchEntry) {
                                          return const Center(
                                            child: Padding(
                                              padding: EdgeInsets.all(20),
                                              child: Text("No languages found"),
                                            ),
                                          );
                                        },
                
                                        loadingBuilder: (context, searchEntry) {
                                          return const Center(
                                            child: CircularProgressIndicator(),
                                          );
                                        },
                                      ),
                onSelected: (value){
                  _authController.selectedLanguage.value = value;
                  _authController.applyFilters();
                  // _authController.filterByLanguage;
                },
                                      // clearButtonProps: const ClearButtonProps(
                                      //   isVisible: true,
                                      // ),
                
                                      // onChanged: _authController.filterByLanguage,
                                    );
                                  }),
                
                                  Row(
                                    children: [
                                      _buildHeader(
                                        'Name',
                                        getColumnWidth(context, 'Name'),
                                        40,
                                      ),
                                      const SizedBox(width: 2,),
                                      _buildHeader(
                                        'Language',
                                        getColumnWidth(context, 'Language'),
                                        40,
                                      ),
                                      const SizedBox(width: 2,),
                                      _buildHeader(
                                        'ID',
                                        getColumnWidth(context, 'ID'),
                                        40,
                                      ),
                                      const SizedBox(width: 2,),
                                      _buildHeader(
                                        'Version',
                                        getColumnWidth(context, 'Version'),
                                        40,
                                      ),
                                    ],
                                  ),
                
                                  Container(
                                    height: 450,
                                    child: ListView.builder(
                                      itemCount: _authController.filteredUserList.length,
                                      // itemCount: _authController.userList.length,
                                      itemBuilder: (context, index) {
                                        // final user = _authController.userList[index];
                                        final user = _authController.filteredUserList[index];
                                        return GestureDetector(
                                          onTap: () {
                                            _authController.openUserDetails(user);
                                          },
                                          child: Container(
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                _buildDetails(
                                                  user.name,
                                                  getColumnWidth(context, 'Name'),
                                                  50,
                                                ),
                                                _buildDetails(
                                                  user.language,
                                                  getColumnWidth(context, 'Language'),
                                                  50,
                                                ),
                                                _buildDetails(
                                                  user.id,
                                                  getColumnWidth(context, 'ID'),
                                                  50,
                                                ),
                                                _buildDetails(
                                                  user.version,
                                                  getColumnWidth(context, 'Version'),
                                                  50,
                                                ),
                                                // _buildDetails('${user.name}',300,50),
                                                // _buildDetails('${user.language}',150,50),
                                                // _buildDetails('${user.id}',300,50),
                                                // _buildDetails('${user.version}',80,50),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            );
                
                          case ApiStatus.initial:
                          default:
                            return const SizedBox.shrink();
                        }
                      }),
                    )
                  ],
                ),
              ))),
    );

  }


  Widget _buildHeader(String column, double wid, double hei) {
    return Obx(() {
      return SizedBox(
        width: wid,
        height: hei,
        child: GestureDetector(
          onTap: () => _authController.sortByColumn(column),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              color: _authController.selectedColumn.value == column
                  ? Colors.red.shade200
                  : Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    column,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    ),
                  ),
                ),
                if (_authController.selectedColumn.value == column)
                  Icon(
                    _authController.isAscending.value
                        ? Icons.arrow_upward
                        : Icons.arrow_downward,
                    size: 16,
                  ),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget _buildDetails(dynamic value,double wid, double hei) {
    return Column(
      children: [
        Container(
          width: wid,
          height: hei,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            // color: Colors.red,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
          ),
          child: Center(
            child: Text(
              value?.toString() ?? "-",
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }


  double getColumnWidth(BuildContext context, String column) {
    final width = MediaQuery.of(context).size.width;

    if (width < 600) {
      switch (column) {
        case 'Name':
          return 180;
        case 'Language':
          return 120;
        case 'ID':
          return 180;
        case 'Version':
          return 80;
        default:
          return 150;
      }
    }

    if (width < 1024) {
      switch (column) {
        case 'Name':
          return width * 0.30;
        case 'Language':
          return width * 0.20;
        case 'ID':
          return width * 0.30;
        case 'Version':
          return width * 0.10;
        default:
          return width * 0.20;
      }
    }

    switch (column) {
      case 'Name':
        return width * 0.32;
      case 'Language':
        return width * 0.18;
      case 'ID':
        return width * 0.35;
      case 'Version':
        return width * 0.10;
      default:
        return 150;
    }
  }

}
