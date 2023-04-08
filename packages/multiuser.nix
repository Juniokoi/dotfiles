{config, pkgs, lib, ... }:

{
	nativeBuildInputs = [ pkgs.makeWrapper ]
	installPhase = ''
		groupadd -r nixbld;
		for n in $(ls /home/); do useradd -c "Nix build user $n" \
		-d /var/empty -g nixbld -G nixbld -M -N -r -s "$(which nologin)" \
		nixbld$n; done
	''
}
