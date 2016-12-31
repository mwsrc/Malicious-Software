As you might've expected, this source isn't fud...
But it should be easy for experienced developers to remake it fud.

There are 3 main sub-projects for this project, resulting in 2 binaries.

"How to":

1. Compile the stub.
2. Open up stubgen project and replace the existing resource with your compiled stub
3. Compile stubgen
4. Compile GUI
5. Now you should have 2 binaries, one for gui and one for stubgen.

Additionally:
If you want to change the embedded XORed strings, just use the included XOR-project and generate new strings,
and remeber to use correct password for the encryption.