package controls;

import openfl.display.SimpleButton;

class BendButton extends SimpleButton {

    private static var tileset:Tileset = null;
	private static var tilemap:Tilemap = null;

    private var tile:Tile = null; 

    public function new(x,y,xdim,ydim){

	var bitmapData = Assets.getBitmapData ("assets/decals.png");
		tileset = new Tileset (bitmapData);
		tileset.addRect (new Rectangle(0*DIM_X,0*DIM_Y,DIM_X,DIM_Y));
		tileset.addRect (new Rectangle(0*DIM_X,1*DIM_Y,DIM_X,DIM_Y));
		tileset.addRect (new Rectangle(0*DIM_X,2*DIM_Y,DIM_X,DIM_Y));

		tileset.addRect (new Rectangle(1*DIM_X,0*DIM_Y,DIM_X,DIM_Y));
		tileset.addRect (new Rectangle(1*DIM_X,1*DIM_Y,DIM_X,DIM_Y));
		tileset.addRect (new Rectangle(1*DIM_X,2*DIM_Y,DIM_X,DIM_Y));

		tilemap = new Tilemap (DIM_X*2, DIM_Y, tileset);
		addChild (tilemap);

		tiles = new Array<Tile>();

		for( i in 0...6 ){
			var tile = new Tile(i);
			
			tile.x = i < 3 ? 0 : DIM_X;

			tiles.push( tile );
		}

		tilemap.addTile(tiles[0]);
		tilemap.addTile(tiles[3]);

    }
}