package main

import webview "github.com/webview/webview_go"

func main() {
	w := webview.New(false)
	defer w.Destroy()
	w.SetTitle("Discord")
	w.SetSize(1200, 700, webview.HintNone)
	w.Navigate("https://discord.com/app")
	w.Run()
}
