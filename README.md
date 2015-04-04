Listing of all the packages bundled in Visual Studio Ultimate 2015 (on my machine) + few 3rd parties.

Place the file `devenv.pkgundef` in your `C:\Program Files (x86)\Microsoft Visual Studio 14.0\Common7\IDE` (next to `devenv.exe`), and run `devenv /updateconfiguration`.
The next time Visual Studio starts, it will refresh the pkgdef cache, and will remove all the packages specified in the `pkgundef` file.

To PREVENT a package from unloading, comment the relevant `[$RootKey$\Packages\{...}]` line with a semicolon (`;`).

To undo, delete the `devenv.pkgundef` file, and run `devenv /updateconfiguration` again.

<h1 style="color:red">USE AT YOUR OWN RISK!</h1>
