@echo off
set i=%*
if "%i%"=="~" (
  cd %userprofile%
  goto EOF
) else if "%i%"=="/?" (
  goto help
) else (
  cd %i%
  goto EOF
)

:help
echo This commad support character "~" to cd to %%USERPROFILE%%
echo Usage is the same as CD. Type CD /? for help.
:EOF

