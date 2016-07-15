File Icons
==========

This is the source for the [File-Icons](https://github.com/DanBrooker/file-icons) package's custom icon-font.

**NOTE:** Don't request icon additions here. Please do that at the [proper repository](https://github.com/DanBrooker/file-icons/issues/).



Adding new icons
----------------
Currently, [IcoMoon](https://icomoon.io/) is used to generate the icon-font.

To add new icons, repeat the following steps:

1. Open [IcoMoon's projects panel](https://icomoon.io/app/#/projects), and select **Import Project**.
2. Select `icomoon.json`, located in this repo's base directory.
3. Click the imported project's **Load** button.
4. Press the ☰ icon near the top-right corner. In the menu that opens, click **Import to Set**. 
5. Select one or more SVG files.
6. Select each imported icon, then press **Generate Font**.
7. Press **Download**.
8. Extract files to the right locations:  
	__Linux/Mac OS:__
	<ol><li>Move the downloaded ZIP folder to this repo's base directory.</li>
	<li>Run `make` from command-line.</li></ol>
	__Windows:__
	<ol><li>Move contents of `fonts` folder into repo's `dist` directory.</li>
	<li>Replace `icomoon.json` with extracted `selection.json`.</li>
	<li>Rename `selection.json` to `icomoon.json`.</li></ol>  

If IcoMoon didn't give you a WOFF2 file, just add what you can (with the SVG) and a maintainer will take care of the rest.


Requirements when adding icons
------------------------------
Before submitting a pull request, make sure you've followed these steps:

1. Always include newly-added SVGs in your fork's `svg` folder.
2. Fit icons to a square canvas when possible. More info on that [here](https://github.com/Alhadis/DevOpicons#size-fixes).
3. Don't add icons that're already included in one of the existing icon-fonts bundled with the package:
	* [Font Awesome](http://fortawesome.github.io/Font-Awesome/cheatsheet/)
	* [DevOpIcons](https://github.com/Alhadis/DevOpicons)
	* [MFixx](https://github.com/Alhadis/MFixx)


Requirements for maintainers
----------------------------
* [Perl 5](https://www.perl.org/)
* [GNU Make](http://www.gnu.org/software/make/manual/make.html)
* [WOFF2 Encoder](https://github.com/google/woff2)

Mac OS/X already ships with Perl and Make installed. The remaining dependencies can be installed with [Homebrew](http://brew.sh/):

	brew install --HEAD homebrew/head-only/woff2

WOFF2 is only necessary for users without a paid IcoMoon account.
