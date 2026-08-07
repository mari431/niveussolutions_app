import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/auth_controller.dart';
import '../../controller/themeController.dart';
import '../constance/globe_colors.dart';
import 'globe_drawer.dart';

class NiveHomeScreen extends StatelessWidget {
  NiveHomeScreen({
    super.key,
  });

  // final AuthController ctrl = Get.find();
  final ThemeController _themeFindController = Get.put(ThemeController());
  final AuthController _authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(title: const Text("Niveus Solutions"),backgroundColor: Colors.transparent,),
        // drawer: globe_drawer(),
        body: Obx(() {
          switch (_authController.apiStatus.value) {
            case ApiStatus.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );

            case ApiStatus.empty:
              return const Center(
                child: Text("No data found"),
              );

            case ApiStatus.error:
              return _buildErrorWidget();

            case ApiStatus.success:
              return isMobile
                  ? _buildMobileView(context)
                  : _buildDesktopTable(context);

            case ApiStatus.initial:
            default:
              return const SizedBox.shrink();
          }
        }),
      ),
    );
  }


  Widget _buildMobileView(BuildContext context) {
    return Column(
      children: [

        _buildSearchWidget(),

        const SizedBox(height: 10),

        _buildLanguageDropdown(),

        const SizedBox(height: 10),

        Row(
          children: [
            _buildHeader(
              "Name",
              getColumnWidth(context, "Name"),
              40,
            ),
            _buildHeader(
              "Language",
              getColumnWidth(context, "Language"),
              40,
            ),
            _buildHeader(
              "ID",
              getColumnWidth(context, "ID"),
              40,
            ),
          ],
        ),

        Expanded(
          child: ListView.builder(
            itemCount: _authController.filteredUserList.length,
            itemBuilder: (context, index) {

              final user =
              _authController.filteredUserList[index];

              return InkWell(
                onTap: () =>
                    _authController.openUserDetails(user),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    _buildDetails(
                      user.name,
                      getColumnWidth(context, "Name"),
                      50,9
                    ),

                    _buildDetails(
                      user.language,
                      getColumnWidth(context, "Language"),
                      50,9
                    ),

                    _buildDetails(
                      user.id,
                      getColumnWidth(context, "ID"),
                      50,9
                    ),

                    // Text(
                    //   user.name,
                    //   style: const TextStyle(
                    //     fontSize: 18,
                    //     fontWeight: FontWeight.bold,
                    //   ),
                    // ),
                    //
                    // const SizedBox(height: 8),
                    //
                    // Text("Language : ${user.language}"),
                    //
                    // Text("ID : ${user.id}"),
                    //
                    // Text("Version : ${user.version}"),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildDesktopTable(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [

            Row(
              children: [
                const SizedBox(width: 10),
                _buildSearchWidget(),

                const SizedBox(width: 10),

                _buildLanguageDropdown(),
                const SizedBox(width: 10),


                Text('Total Records: ${_authController.filteredUserList.length}'),
              ],
            ),

            const SizedBox(height: 10),



            Row(
              children: [
                _buildHeader(
                  "Name",
                  getColumnWidth(context, "Name"),
                  40,
                ),
                _buildHeader(
                  "Language",
                  getColumnWidth(context, "Language"),
                  40,
                ),
                _buildHeader(
                  "ID",
                  getColumnWidth(context, "ID"),
                  40,
                ),
                _buildHeader(
                  "Version",
                  getColumnWidth(context, "Version"),
                  40,
                ),
              ],
            ),



            Expanded(
              child: ListView.builder(
                itemCount:
                _authController.filteredUserList.length,
                itemBuilder: (context, index) {

                  final user =
                  _authController.filteredUserList[index];

                  return GestureDetector(
                    onTap: () =>
                        _authController.openUserDetails(user),
                    child: Row(
                      children: [

                        _buildDetails(
                          user.name,
                          getColumnWidth(context, "Name"),
                          50,12,
                        ),

                        _buildDetails(
                          user.language,
                          getColumnWidth(context, "Language"),
                          50,12,
                        ),

                        _buildDetails(
                          user.id,
                          getColumnWidth(context, "ID"),
                          50,12,
                        ),

                        _buildDetails(
                          user.version,
                          getColumnWidth(context, "Version"),
                          50,12
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchWidget() {
    return SizedBox(
      width: 300,
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
    );
  }

  Widget _buildLanguageDropdown() {
    return SizedBox(
      width: 300,
      child: DropdownSearch<String>(
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
        onSelected: (value) {
          _authController.selectedLanguage.value = value;
          _authController.applyFilters();
          // _authController.filterByLanguage;
        },
      ),
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

  Widget _buildDetails(dynamic value,double wid, double hei, double fontSize) {
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
              style: TextStyle(
                fontSize: fontSize,
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


  Widget _buildErrorWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            _authController.errorMessage.value,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: () {
              _authController.getAllDataSet();
            },
            icon: const Icon(Icons.refresh),
            label: const Text("Retry"),
          ),
        ],
      ),
    );
  }





}
