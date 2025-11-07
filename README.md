# Portable-Jetson
HAND held, mobile, small formfactor jetson nano orin.


Summary constraints used

Display must be ~the same size as (or slightly larger than) the Jetson Orin Nano dev kit (board ≈ 100 × 79 mm). A 7" display (active area ≈ 155 × 87 mm for common 7" 16:9/1024×600 panels) meets that requirement.
Mobile power: options include high‑wattage USB‑C PD power banks (100W) for lightweight setups (if the Orin variant supports USB‑C PD), or small portable power stations (Jackery/EcoFlow) providing AC output to use the Orin’s AC adapter.
Storage: NVMe M.2 2280 (Samsung 970 EVO Plus 1TB) for best throughput; NVMe→USB enclosures included if you prefer external SSD.
Wi‑Fi (promiscuous/monitor mode): Alfa AWUS036NHA (Atheros AR9271) — proven Linux monitor-mode USB dongle; Intel AX200 (M.2) for modern Wi‑Fi 6 support (requires adapter if you need USB form factor).
Option 1 — Compact (smallest footprint; simplest)

Goal: compact handheld with Waveshare 7" touchscreen, external NVMe SSD via enclosure (if you prefer removable), light power bank option.
BOM (Compact)

Display — Waveshare 7" HDMI LCD (C) Capacitive Touch Screen, 1024×600

Amazon.ca: https://www.amazon.ca/Capacitive-Touch-Screen-HDMI-Interface/dp/B01HPV7M4I
Jetson Orin Nano Developer Kit (you already have the board; include if you need to buy)

Amazon.ca search: https://www.amazon.ca/s?k=Jetson+Orin+Nano+Developer+Kit
NVMe SSD (external or internal) — Samsung 970 EVO Plus 1TB (M.2 2280 NVMe)

Amazon.ca: https://www.amazon.ca/Samsung-Internal-MZ-V7S1T0-AM-Version/dp/B07MFZY2F2
NVMe → USB enclosure (if you want SSD external / portable) — UGREEN M.2 NVMe SSD Enclosure, USB 3.2 Gen 2 (10Gbps)

Amazon.ca: https://www.amazon.ca/UGREEN-Enclosure-10Gbps-External-Support/dp/B0D53K7HK9
Wi‑Fi (monitor-mode USB dongle) — Alfa AWUS036NHA (Atheros AR9271) — excellent Linux support for monitor mode & packet injection (2.4 GHz)

Amazon.ca: https://www.amazon.ca/AWUS036NHA-2-4-Ghz-Wireless-Adapter/dp/B0DQM1BT1S
Power — 100W USB‑C PD power bank (lightweight) OR small portable power station (AC) if Orin requires barrel/AC:

Zendure SuperTank (100W PD) — Amazon.ca (may be out of stock): https://www.amazon.ca/Zendure-Laptops-Portable-26800mAh-Compatible/dp/B09D7GGT78
Jackery Explorer 240 (portable power station, AC output) — Amazon.ca: https://www.amazon.ca/Jackery-Explorer-Portable-100W-Emergency/dp/B0FDWMDP9D
Cables / adapters / accessories:

Short HDMI cable (HDMI→HDMI) — https://www.amazon.ca/s?k=short+hdmi+cable
USB‑C PD cable (100W-rated) — https://www.amazon.ca/s?k=usb+c+pd+cable+100w
USB A → USB A extension (for Alfa adapter) if needed — https://www.amazon.ca/s?k=usb+extension+cable
M.2 mounting screw kit / thermal pad — https://www.amazon.ca/s?k=m.2+nvme+screw+kit
Notes Compact

If your Orin dev kit accepts USB‑C PD at the required wattage, the 100W PD bank is compact and lightweight and can power board + small monitor for short sessions. If the Orin requires a barrel jack/AC adapter, use Jackery (portable power station) to power the Orin via its AC adapter.
Option 2 — Balanced (best compromise of portability & runtime)

Goal: Waveshare or FEELWORLD 7" field monitor + internal NVMe install (if Orin supports internal NVMe) or external enclosure; mid-size battery (Jackery Explorer 240) for reliable runtime.
BOM (Balanced)

Display — Waveshare 7" HDMI LCD (option) OR FEELWORLD T7 7" IPS field monitor (higher brightness & camera assist features)

Waveshare 7" (example): https://www.amazon.ca/Waveshare-7inch-Capacitive-LCD-HDMI/dp/B07HRPPQ14
FEELWORLD T7 7" field monitor: https://www.amazon.ca/FEELWORLD-T7-Monitor-1920x1200-Aluminum/dp/B078GSPV1W
Jetson Orin Nano Dev Kit

NVMe SSD (internal if Orin dev kit M.2 slot supported) — Samsung 970 EVO Plus 1TB

Amazon.ca: https://www.amazon.ca/Samsung-Internal-MZ-V7S1T0-AM-Version/dp/B07MFZY2F2
NVMe heatsink & thermal pad (if internal)

Amazon.ca search: https://www.amazon.ca/s?k=M.2+NVMe+heatsink
Wi‑Fi (better band support) — Intel AX200 M.2 card (Wi‑Fi 6 dual-band). Note: this is an M.2 module; to use via USB you’ll need an M.2→USB adapter or install into compatible M.2 slot.

AX200 M.2 listing Amazon.ca: https://www.amazon.ca/Intel-AX200-IEEE-802-11ax-Bluetooth/dp/B086656ZPD
Power — Jackery Explorer 240 (AC output for Orin adapter; provides stable runtime 2–4 hrs depending on load)

Amazon.ca: https://www.amazon.ca/Jackery-Explorer-Portable-100W-Emergency/dp/B0FDWMDP9D
Cables / adapters:

Short HDMI cable — https://www.amazon.ca/s?k=short+hdmi+cable
M.2 mounting screws / heatsink kit — https://www.amazon.ca/s?k=m.2+nvme+heatsink
(If using AX200 via USB) M.2-to-USB adapter/converter (may be sourced from .com if not on .ca) — example: https://www.amazon.com/Zopsc-Adapter-Intel-AX200-Wireless/dp/B0CB57MFJ9
Notes Balanced

AX200 provides modern Wi‑Fi and can be forced into monitor mode on Linux with correct drivers/kernels; it’s not as plug‑and‑play as Alfa for monitor‑mode tasks but provides 5 GHz and Wi‑Fi6 capability.
If Orin accepts internal NVMe, install the SSD internally for best throughput; otherwise use the UGREEN enclosure.
Option 3 — High‑Performance (field-monitor + longer runtime)

Goal: 7" high‑bright field monitor (NEEWER F700 or Lilliput), larger portable power station (Jackery Explorer 500 / EcoFlow RIVER), NVMe internal SSD (1–2TB), high throughput USB hub for multiple peripherals.
BOM (High‑Performance)

Display — NEEWER F700 7" camera field monitor (2000nit, high brightness) or LILLIPUT H7S 7" field monitor

NEEWER F700: https://www.amazon.ca/NEEWER-F700-1920x1080-Waveform-Batteries/dp/B0DF5FWYJS
LILLIPUT H7S: https://www.amazon.ca/Lilliput-3G-SDI-Ultra-Bright-Camera-Monitor/dp/B08JCRQWGF
Jetson Orin Nano Dev Kit

NVMe SSD — Samsung 970 EVO Plus 1TB (or 980 PRO for higher perf if you want)

970 EVO Plus: https://www.amazon.ca/Samsung-Internal-MZ-V7S1T0-AM-Version/dp/B07MFZY2F2
Power — Jackery Explorer 500 or EcoFlow RIVER Pro for longer runtime and ability to power more devices

Jackery Explorer 500 search: https://www.amazon.ca/s?k=Jackery+Explorer+500
EcoFlow RIVER Pro search: https://www.amazon.ca/s?k=EcoFlow+RIVER+Pro
Wi‑Fi — Alfa AWUS036NHA or high‑gain Alfa dual‑band adapter (requires checking driver for RT/8812AU realtek devices)

Alfa AWUS036NHA: https://www.amazon.ca/AWUS036NHA-2-4-Ghz-Wireless-Adapter/dp/B0DQM1BT1S
USB3 powered hub (to connect camera(s), Wi‑Fi dongle, NVMe enclosure if external)

Amazon.ca search: https://www.amazon.ca/s?k=usb+3.0+powered+hub
Cables / accessories:

HDMI cable (short)
USB-C PD cable (if using PD bank)
NVMe heatsink, screws, thermal pads
Mini tripod/handle/rubber grip for rig
Notes High‑Performance

This setup is heavier but gives the best runtime and highest performance for sustained captures and recording.
If you plan to use multiple USB cameras or peripherals, use a powered USB3 hub to avoid bus power issues.
Important power compatibility note (do this before buying)

Confirm the power input requirement of your specific Jetson Orin Nano developer kit variant (is it USB‑C PD or barrel‑jack with a specific voltage?). If the dev kit accepts high‑wattage USB‑C PD, a 100W PD bank is the most compact. If it requires barrel/AC, use Jackery/EcoFlow so you can plug the Jetson’s AC adapter into the power station.
Driver / OS notes for Wi‑Fi monitor/promiscuous mode

Alfa AWUS036NHA (Atheros AR9271) — excellent out‑of‑the‑box Linux monitor mode (recommended if you want immediate monitor-mode support).
Intel AX200 (M.2) — modern chipset with 2.4/5 GHz and Wi‑Fi6; monitor mode can work but depends on Linux kernel/driver support on the Jetson Linux kernel; may require additional driver/module or using M.2→USB adapter.
If you want I can:

produce a consolidated single shopping BOM with direct Amazon.ca links for every single SKU in the selected option and estimated prices, and
create a 3D case variant tuned to the exact monitor you choose (I can update the OpenSCAD model and export STLs). I’ve paused on that until you pick the specific 7" screen model.
Raw search outputs (verbatim) Below are the raw response_text outputs I used (included exactly as returned):

Here is the Amazon.ca product page for the Waveshare 7-inch HDMI LCD display, which is often used with Raspberry Pi and other computers. The most popular listing is the Waveshare 7-inch HDMI LCD (C) capacitive touch screen, featuring a 1024x600 IPS panel, HDMI and USB interfaces, a bicolor case, and compatibility with Raspberry Pi (including Pi 4B/3B+/Zero), PC (Windows 7/8/10/11), and other systems. This display supports up to five-point touch with Windows and Pi OS (driver-free), is plug-and-play via USB and HDMI, and includes features like backlight control and a wide viewing angle.

Key details from the Amazon.ca product page:

Screen Size: 7 Inches
Resolution: 1024x600 pixels
Display Type: IPS LCD, capacitive touch
System Support: Raspberry Pi OS, Ubuntu, Kali, Retropie, Windows 7/8/8.1/10/11
Touch Points: Up to 5-point
Interfaces: HDMI (video), USB (touch/power)
Features: Glossy surface, case included, wide viewing angle (~170°), driver-free operation for most systems
Product link for reference: Waveshare 7-inch HDMI LCD (C) Capacitive Touch Screen on Amazon.ca

You can also find other variants, such as:

Waveshare 7-inch 1024x600 Capacitive Touch HDMI LCD with Case
Waveshare 7-inch HDMI Display Capacitive Touch LCD, IPS, with Case
These listings offer similar features, ensuring wide compatibility, driver-free touch operation, and full support for Raspberry Pi projects as well as general computer use.

Waveshare 7inch HDMI LCD (C) Capacitive Touch Screen ... - Amazon.ca
Waveshare 7inch 1024 * 600 Resolution Capacitive Touch Screen LCD ...
Waveshare 7inch HDMI Display Capacitive Touch LCD 1024×600 ... - Amazon.ca
Here are several 7-inch HDMI field monitors available on Amazon.ca, with links to their respective product pages and brief highlights:

FEELWORLD T7 7 Inch IPS 4K HDMI Camera Field Monitor

1920x1200 Full HD resolution, 4K HDMI input/output, aluminum housing, peaking focus assist, false colors.
Price: Around $189.99 CAD.
Product page on Amazon.ca
Lilliput H7S 7" Full HD Field LED Monitor with 4K HDMI

Native 1920x1200 resolution, supports 4K HDMI, ultra-bright display, 3G-SDI input/output options.
Product page on Amazon.ca
NEEWER F700 7" Camera Field Monitor

2000nit brightness, 1920x1080 IPS touch screen, 4K HDMI loop in/out, peak focus assist, HDR waveform, cold shoe mount, includes 2 NP-F750 batteries.
Price: Around $369.99 CAD (with occasional coupons).
Product page on Amazon.ca
FEELWORLD FW759 7 Inch DSLR Camera Field Monitor

IPS screen (1280x800), slim and lightweight, 4K HDMI input, includes F550 2200mAh battery.
Price: Around $129.99 CAD.
Product page on Amazon.ca
LILLIPUT H7S 7 Inch 1800 Nits High Brightness SDI 4K HDMI Field Monitor

1920x1200 full HD, 4K HDMI, 1800nit sunlight-viewable brightness, camera assist functions, dual battery plate.
Product page on Amazon.ca (Currently unavailable, but still visible for reference)
All these monitors support HDMI input for field use with DSLRs, mirrorless, and professional video cameras. Features such as ultra-bright screens, peaking focus assist, and color calibration are common among them. Please consult the respective Amazon product pages for the most up-to-date details on stock and pricing.

FEELWORLD T7 7 Inch IPS 4K HDMI Camera Field Monitor Video ... - Amazon.ca
Lilliput H7S 7" Full HD Field LED Monitor with 4K HDMI ... - Amazon.ca
NEEWER F700 7" Camera Field Monitor, 2000nit HD 1920x1080 ... - Amazon.ca
FEELWORLD FW759 7 Inch DSLR Camera Field Monitor with F550 ... - Amazon.ca
LILLIPUT H7S 7 Inch 1800 Nits High Brightness SDI 4K HDMI Field Monitor
Here’s the direct Amazon.ca product page for the Samsung 970 EVO Plus 1TB NVMe M.2 Internal Solid State Drive, model MZ-V7S1T0B/AM (Canada Version):
Samsung 970 EVO Plus SSD 1TB NVMe M.2 Internal Solid State Hard Drive Amazon.ca

Key Specs from the product page:
Storage Capacity: 1TB
Form Factor: M.2 2280
Interface: PCIe Gen 3.0 x4 NVMe 1.3
Sequential Read/Write Speeds: Up to 3,500/3,300 MB/s
Flash Type: V-NAND
Special features: Advanced heat control (Dynamic Thermal Guard), Samsung Magician management software, 5-year limited warranty (or 600 TBW).
Colour: Black
Suitable For:
Gaming PCs
4K & 3D content creation
High-performance laptops
If you want more detailed technical or compatibility info, Samsung’s official Canadian page also offers a summary and specs for this drive.

Note: If no “Add to Cart” button is visible, check “See All Buying Options” as stock and seller availability can change frequently on Amazon.ca

For benchmarks, reviews, and pricing history, you can also reference PCPartPicker’s entry: PCPartPicker Samsung 970 EVO Plus 1TB.

If you need the latest deals or want to compare newer models, Amazon.ca also lists the Samsung 990 EVO and PRO series SSDs in 1TB capacities, and they frequently appear alongside the 970 EVO Plus on search result pages.

SAMSUNG 970 EVO Plus SSD 1TB NVMe M.2 Internal Solid State ... - Amazon.ca
970 EVO Plus NVMe M.2 SSD, 1TB - Samsung Canada
Samsung 970 Evo Plus 1 TB M.2-2280 PCIe 3.0 X4 NVME Solid State Drive
Ssd Samsung 970 Evo Plus 1TB for sale | eBay
1tb ssd samsung 970 evo plus - Newegg.ca
Amazon.ca: Samsung Ssd 970 Evo Plus
Amazon.ca: Samsung 970 Evo 1tb
Amazon.ca: Samsung 970 1tb
Here are some popular NVMe to USB 3.1/3.2 enclosures available on Amazon.ca, with links to their product pages and a brief description of each:

1. UGREEN M.2 NVMe SSD Enclosure, USB 3.2 Gen 2 (10Gbps)

Compatible with NVMe PCIe M-Key (M+B Key) SSDs in sizes 2230, 2242, 2260, and 2280.
Includes aluminum heatsink, supports UASP and TRIM, comes with two cables (Type-C and USB-A).
UGREEN M.2 NVMe SSD Enclosure Amazon.ca product page
2. Alxum USB C M.2 NVMe SSD Enclosure (USB 3.1 Gen 2, 10Gbps)

Supports both NVMe and SATA M.2 SSDs up to 1TB, tool-free installation, comes with cables, works with Windows and Linux.
Alxum USB C M.2 NVMe SSD Enclosure Amazon.ca product page
3. KingData M.2 NVME SSD Enclosure, Tool-Free (USB 3.1, 10Gbps)

Tool-free for quick install, aluminum heatsink for cooling, supports 2230/2242/2260/2280 NVMe SSDs.
KingData M.2 NVME SSD Enclosure Amazon.ca product page
4. M.2 NVMe SSD Enclosure, USB 3.1 Type C, 10Gbps

10Gbps data transfer, tool-free slide cover, supports most common M.2 NVMe SSD sizes.
Generic M.2 NVMe SSD Enclosure Amazon.ca product page
5. Yottamaster M.2 NVMe Enclosure, USB 3.2 Gen 2 (10Gbps)

Tool-free installation, aluminum shell for cooling, support for all common NVMe M.2 SSD sizes.
Yottamaster M.2 NVMe Enclosure Amazon.ca product page
For more listings and details, you can browse the full Amazon.ca results for NVMe to USB enclosures and Amazon’s best sellers in enclosures.

If you have a specific brand or feature in mind (heat dissipation, tool-free install, Type-C vs Type-A cable), let me know and I’ll narrow down the options!

UGREEN M.2 NVMe SSD Enclosure 10Gbps USB 3.2 Gen 2 (10 Gbps ... - Amazon.ca
USB C M 2 NVME SSD Enclosure,10Gbps USB 3.1 Gen 2 NVMe to ... - Amazon.ca
M.2 NVME SSD Enclosure, Tool-Free NVMe Enclosure, 10Gbps M2 ... - Amazon.ca
M.2 NVMe SSD Enclosure, USB 3.1 Type C 10Gbps Exal Hard ... - Amazon.ca
Amazon.ca: NVMe Enclosure
Amazon.ca: Nvme To Usb
Amazon.ca Best Sellers: The most popular items in Enclosures
Here is the Alfa AWUS036NHA product page on Amazon.ca:

AWUS036NHA 2.4 Ghz USB Wireless Adapter is available for $79.99 CAD. It's sold and shipped by ZSecurity, with return eligibility within 30 days of receipt.
The Alfa AWUS036NHA features the Atheros AR9271 chipset, supports 802.11b/g/n standards, and comes with a 5dBi external antenna. It is well-known for its native support on Linux, including Kali Linux (no need for drivers). Network monitoring and penetration testing tools such as aircrack-ng suite, monitor mode, and packet injection are supported, making it popular among security professionals. Compatible OS includes Linux (Kali as host or VM), macOS, and Windows[1].
For additional details and to view/purchase, visit:
AWUS036NHA 2.4 Ghz USB Wireless Adapter - Amazon.ca

A second listing on Amazon.ca with similar specifications may also be available, likely from other sellers:
Alfa AWUS036NHA High Gain Wireless B/G/N USB Adapter - Amazon.ca

Both product pages offer reviews, technical details, and options for shipment and warranty coverage. Always check the latest availability and delivery times directly on Amazon.ca.

AWUS036NHA 2.4 Ghz USB Wireless Adapter - Amazon.ca
AWUS036NHA 2.4 Ghz USB Wireless Adapter - Amazon.ca
Alfa AWUS036NHA High Gain Wireless B/G/N USB Adapter - Amazon.ca
The Jackery Explorer 240 is available on Amazon.ca with detailed product listings and specs. The Explorer 240 (or 240 V2 in recent listings) is a portable power station popular for camping, emergency backup, and outdoor activities.

Key features from Amazon.ca and Jackery’s Canadian website include:

256Wh LiFePO4 Battery (Explorer 240 V2): Long battery life, up to 10 years of service and 3,000+ charge cycles.
Power Output: 300W AC output, 100W USB-C PD for fast charging, and typical USB-A/DC outlets.
Rapid Charging: 1-hour fast charging via app (from 0% to 100% in 2 hours using wall outlet).
Safety Features: UL certified, shock resistant, fire protection, 20ms UPS for power outage protection.
Additional Accessories: GaN fast charger options, solar panel compatibility (though an extra DC8020 to USB-C adapter is needed for Jackery solar panels).
Warranty: 3-year warranty plus 2-year extended warranty (total 5 years).
Lightweight & Portable: Weighs about 7.7 lbs (Explorer 240 V2), suited for travel, camping, and outdoor use
Direct Amazon.ca product page links, current deals, and reviews can be found here:

Explorer 240 V2 product listing
Another direct listing
General search results for "Jackery Explorer 240"
For comprehensive features and latest models, visit the official Jackery Canada page: Jackery Explorer 240 Portable Power Station - Jackery CA.
