# Borrowed from https://github.com/stelcodes/nixflake as shared in their reddit post: https://www.reddit.com/r/NixOS/comments/1b56jdx/simple_nix_function_for_wrapping_executables_with/
{ pkgs, lib }:

{ pkgs, executable, desktop ? null, profile ? null, extraArgs ? [ ] }:
    pkgs.runCommand "firejail-wrap" {
			preferLocalBuild = true;
			allowSubstitutes = false;
			meta.priority = -1; # take precedence over non-firejailed versions
		}
		(
			let
        firejailArgs = lib.concatStringsSep " " (extraArgs ++ (lib.optional (profile != null) "--profile=${toString profile}"));
			in
			''
				command_path="$out/bin/$(basename ${executable})"
				mkdir -p $out/bin
				mkdir -p $out/share/applications
				cat <<'_EOF' >"$command_path"
				#! ${pkgs.runtimeShell} -e
				exec /run/wrappers/bin/firejail ${firejailArgs} -- ${toString executable} "\$@"
				_EOF
				chmod 0755 "$command_path"
			'' + lib.optionalString (desktop != null) ''
				substitute ${desktop} $out/share/applications/$(basename ${desktop}) \
					--replace ${executable} "$command_path"
			''
		)