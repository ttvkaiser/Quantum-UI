# 🌌 Quantum UI

*A brand new, lightweight, and modern Roblox UI library by [ttvkaiser](https://github.com/ttvkaiser)*

---

## 📖 About

Quantum UI is a fast and user-friendly Roblox UI library designed for smooth integration and customization. Whether you're making a feature-rich hub or a small tool, Quantum UI gives you powerful tools to create clean and professional interfaces easily.

---

## ✨ Features

- ⚙️ Simple and intuitive API
- 🎨 Custom themes and window sizes
- 🚀 Lightweight and performance-optimized
- 🧱 Modular and easily extendable
- 🖱️ Supports buttons, toggles, sliders, text inputs, and more

---

## 📸 How It Looks!

![Quantum UI Preview](https://i.imgur.com/M2Fw3lL.png)

---

## 🚀 Getting Started

### 🔗 Load Quantum UI

```lua
local QuantumUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/ttvkaiser/Quantum-UI/refs/heads/main/Library.lua"))()
```

---

🪟 Create Your First Window

```lua
local window = QuantumUI:CreateWindow({
    Title = "Quantum UI Example",
    SubTitle = "by ttvkaiser",
    Size = UDim2.fromOffset(750, 500) -- Recommended size!
})
```

---

📁 Add a Tab

```lua
local tab1 = QuantumUI:CreateTab("Main")
```

---

📦 Add Elements

```lua
-- Section
QuantumUI:AddSection(tab1, "Example Section")

-- Toggle
QuantumUI:AddToggle(tab1, "Example Toggle", false, function(state)
    print("Toggle:", state)
end)

-- Button
QuantumUI:AddButton(tab1, "Button Example", function()
    print("Hello from button")
end)

-- Paragraph
QuantumUI:AddParagraph(tab1, "This is Quantum UI. You can use this paragraph to give instructions or info. — EXAMPLE PARAGRAPH")

-- Slider
QuantumUI:AddSlider(tab1, "Example Slider", 10, 100, 16, function(val)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = val
end)
```

---

❓ Help & Support

💬 Reach out on Discord for support, questions, or suggestions.

🐞 Found a bug? Open an issue on the GitHub Repository.



---

🧾 License

This project is licensed under the MIT License — feel free to use it in your projects!


---

🧠 Languages Used

Lua (Roblox)

HTML / CSS / JavaScript (for potential documentation/site)

Python, C++, C+ (for possible extensions or future integration)



---

❤️ Made with Love by ttvkaiser

If you enjoy using Quantum UI, consider starring the repo and sharing it with others in the community!

Let me know if you'd like a badge layout at the top or contribution guidelines added too.
