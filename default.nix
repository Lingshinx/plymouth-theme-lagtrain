{
  stdenvNoCC,
  lib,
}:
with lib;
  stdenvNoCC.mkDerivation {
    pname = "plymouth-matrix-theme";
    version = "0.1";

    src = cleanSource ./.;

    installPhase = let
      base = "$out/share/plymouth/themes/lagtrain";
    in ''
      runHook preInstall

      mkdir -p ${base}
      cp -r $src/* ${base}
      sed -i "s@/usr/@$out/@" ${base}/lagtrain.plymouth

      runHook postInstall

    '';

    postPatch = ''
      rm *.nix README.md LICENSE
    '';

    dontBuild = true;

    meta = with lib; {
      description = "plymouth boot theme from Lagtrain MV";
      longDescription = ''
        I just very like this MV as plymouth theme
        please don't kill me
      '';
      license = license.gpl3;
      platforms = platforms.linux;
    };
  }
