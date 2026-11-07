# Greeting App

A minimal decentralized app that reads and updates a message stored in a smart contract on the Sepolia test network. The same app is implemented twice, so you can compare the two main JavaScript libraries:

| Folder | Library | Version |
|---|---|---|
| [`etherjs/`](etherjs/app.html) | ethers.js | 6.7.0 |
| [`web3js/`](web3js/app.html) | web3.js | 4.16.0 |

Both apps use the contract at [`0xb632F2d22DA874b994fc81E0bd70B6F503D94071`](https://sepolia.etherscan.io/address/0xb632F2d22DA874b994fc81E0bd70B6F503D94071). The Solidity source is not part of this repository.

## Requirements

- A desktop browser with the [MetaMask](https://metamask.io/) extension
- MetaMask set to the **Sepolia** network
- Some SepoliaETH to pay for gas when you set a message (reading is free)
- Python 3 to run the web server (already included in the default GitHub Codespaces image)

## Run locally

```bash
./serve.sh
```

Then open one of these pages:

- ethers.js: <http://localhost:8000/etherjs/app.html>
- web3.js: <http://localhost:8000/web3js/app.html>

To use a different port, run `./serve.sh 3000`.

Don't open `app.html` directly from disk. MetaMask does not work on `file://` pages by default, so the app needs a web server.

## Run in GitHub Codespaces

1. Push this repository to GitHub and open it in a codespace.
2. In the codespace terminal, run:

   ```bash
   ./serve.sh
   ```

   The script prints the forwarded URLs for both apps.
3. Open a URL in a **regular browser tab** where MetaMask is installed. You can also find the forwarded address in the **Ports** tab.

Keep these points in mind:

- **Don't use the browser built into VS Code.** MetaMask runs in your own browser rather than in the codespace, so the built-in browser reports that it isn't installed.
- **Forwarded ports are private by default.** Only you can open the page. To share it, set the port's visibility to **Public** in the **Ports** tab.
- **Public ports expose the whole repository folder.** The server serves everything in the repository, including `.git/`. Don't make the port public if the repository or its history contains anything private.

## Usage

1. Open the page and approve the MetaMask connection request.
2. Select **Get Message** to read the current message.
3. Type some text, select **Set Message**, and confirm the transaction in MetaMask.

When a new `SetMessage` event arrives, the page updates the message automatically.

## Troubleshooting

| Message or symptom | What to do |
|---|---|
| "Metamask is not installed, you cannot use this app" | Install MetaMask, or open the page in the browser where it is installed. |
| "Please switch MetaMask to the Sepolia network" | Switch to Sepolia in MetaMask. The page reloads by itself. |
| "Not connected: approve MetaMask..." | Reload the page and approve the connection request. |
| "Could not read the message: ..." | Check that MetaMask is on Sepolia and that its network connection is working. |
| Set Message fails with an error | Check that you have enough SepoliaETH and that you confirmed the transaction. |

## Using the local library files

By default, each app loads its library from a CDN. Each folder also has a local copy, which you can use by swapping the commented-out line at the top of `app.html`:

- `etherjs/ethers.min.js` is version 6.7.0, the same as the CDN version.
- `web3js/web3.min.js` is version 4.2.2, which is older than the CDN version.
