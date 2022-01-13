// this defined what one item in the order should look like
class ItemModel {
  final String item_id; // could keep as int too as per need
  final String item_name;
  int item_quantity;
  final double cost;
  final String description;
  final String url;

  ItemModel({
    this.item_id = '1',
    this.item_name = 'Masala Dosa',
    this.item_quantity = 1,
    this.cost = 400,
    this.description =
        'Masala dosa is a variation of the popular South Indian dosa, which has its origins in Tuluva Udupi cuisine of Karnataka.[1] It is made from rice, lentils, potato, fenugreek, ghee and curry leaves, and served with chutneys and sambar. It is popular in South India,[2] it can be found in all other parts of the country[3][4] and overseas.[5][6] In South India, preparation of masala dosa varies from city to city.[3] There are variations in Masala dosa like Mysore masala dosa, Rava masala dosa, Onion masala dosa, Paper masala dosa, Cheese masala dosa etc.',
    this.url =
        "https://res.cloudinary.com/swiggy/image/upload/f_auto,q_auto,fl_lossy/zy6ymtixm4vtjuhakijm",
  });
}
