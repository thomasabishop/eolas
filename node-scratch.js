process.stdin.on("data", (data) => {
  process.stdout.write(data.toString().trim());
  process.exit();
});

process.stdout.write("\n What is your name? \n");
process.stdout.write(` \n > `);
