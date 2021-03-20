//
//  HistoryTableViewCell.swift
//  SAMPolibatam
//
//  Created by Agus Riady on 20/03/21.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {

    @IBOutlet weak var lblTanggal: UILabel!
    @IBOutlet weak var lblMasuk: UILabel!
    @IBOutlet weak var lblKeluar: UILabel!
    @IBOutlet weak var lblLokasi: UILabel!
    @IBOutlet weak var lblKeterangan: UILabel!
    @IBOutlet weak var kotakKeterangan: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        lblTanggal.adjustsFontSizeToFitWidth = true
        lblLokasi.adjustsFontSizeToFitWidth = true
        lblKeterangan.adjustsFontSizeToFitWidth = true
        
        kotakKeterangan.layer.cornerRadius = 12.0
            // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
