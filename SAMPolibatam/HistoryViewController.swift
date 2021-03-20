//
//  HistoryViewController.swift
//  SAMPolibatam
//
//  Created by Agus Riady on 19/02/21.
//

import UIKit

class HistoryViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: Deklarasi Data History
    var riwayatTanggal = ["Test1", "Test2", "Test3", "Test1", "Test2", "Test3"]
    var riwayatMasuk = ["11:11", "22:22", "33:33", "??:??", "22:22", "33:33"]
    var riwayatKeluar = ["11:11", "??:??", "33:33", "??:??", "22:22", "33:33"]
    var riwayatLokasi = ["Polibatam", "Polibatam", "Rumah", "", "Rumah", "Polibatam"]
    // Deklarasi Data History (End)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
}

//MARK: Table History Count
extension HistoryViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return riwayatTanggal.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? HistoryTableViewCell
        cell?.lblTanggal.text = riwayatTanggal[indexPath.row]
        cell?.lblMasuk.text = riwayatMasuk[indexPath.row]
        cell?.lblKeluar.text = riwayatKeluar[indexPath.row]
        cell?.lblLokasi.text = riwayatLokasi[indexPath.row]
        
        //MARK: Warna Label Keterangan
        if cell?.lblMasuk.text == "??:??" {
            cell?.lblKeterangan.text = "✗ Alpha"
            cell?.lblKeterangan.textColor = .red
            cell?.kotakKeterangan.backgroundColor = UIColor(red: 0.99607843, green: 0.94117647, blue: 0.89411765, alpha: 1.0)
        } else if cell?.lblKeluar.text == "??:??" {
            cell?.lblKeterangan.text = "✗ Belum Absen Pulang"
            cell?.lblKeterangan.textColor = .red
            cell?.kotakKeterangan.backgroundColor = UIColor(red: 0.99607843, green: 0.94117647, blue: 0.89411765, alpha: 1.0)
        }else {
            cell?.lblKeterangan.text = "✓ Sudah Absen"
            cell?.lblKeterangan.textColor = .systemGreen
            cell?.kotakKeterangan.backgroundColor = UIColor(red: 0.847, green: 0.847, blue: 0.847, alpha: 1.0)
        }
        // Warna Label Keterangan (End)
        return cell!
    }
}
// Table History Count (End)
