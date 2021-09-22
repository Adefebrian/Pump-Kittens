<template>
  <div class="attr_tab">
    <div v-for="(attr, idx) in attributes" :key="'attr' + idx">
      <div class="category">
        <div class="text-h6">{{ attr.category }}</div>
      </div>
      <div v-for="(cat, c_idx) in attr.items" :key="'cat' + c_idx">
        <div class="d-flex align-items-center justify-space-between">
          <div>
            {{ c_idx + 1 }}.<u>{{ cat.name }}</u>
          </div>
          <div>{{ cat.count }} <span>/</span> {{ attr.total }}</div>
        </div>
        <div class="d-flex flex-nowrap imgRow">
          <img
            v-for="(img, i_idx) in cat.images"
            :key="'img' + i_idx"
            :src="img"
            class="img-attrb"
          />
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "attribute",
  data() {
    return {
      attributes: [
        {
          category: "Super rarity",
          total: 100,
          items: [
            {
              name: "Covid Mask",
              count: 2,
              images: [
                require("@/images/1.png"),
                require("@/images/2.png"),
              ],
            },
            {
              name: "Crown",
              count: 3,
              images: [
                require("@/images/5.png"),
                require("@/images/6.png"),
                require("@/images/48.png"),
              ],
            },
            {
              name: "Elf Horns",
              count: 1,
              images: [
                require("@/images/10.png"),
              ],
            },
            {
              name: "Horns",
              count: 1,
              images: [
                require("@/images/9.png"),
              ],
            },
            {
              name: "Rainbow",
              count: 2,
              images: [
                require("@/images/7.png"),
                require("@/images/8.png"),
              ],
            },
            {
              name: "Unicorn horn",
              count: 3,
              images: [
                require("@/images/3.png"),
                require("@/images/4.png"),
                require("@/images/45.png"),
              ],
            },
          ],
        },
        {
          category: "Uniqueness",
          total: 100,
          items: [
            {
              name: "Bracelet",
              count: 4,
              images: [
                require("@/images/3.png"),
                require("@/images/5.png"),
                require("@/images/6.png"),
                require("@/images/12.png"),
              ],
            },
            {
              name: "Bracelets",
              count: 2,
              images: [
                require("@/images/28.png"),
                require("@/images/31.png"),
              ],
            },
            {
              name: "Hat",
              count: 4,
              images: [
                require("@/images/24.png"),
                require("@/images/40.png"),
                require("@/images/41.png"),
                require("@/images/49.png"),
              ],
            },
            {
              name: "Headband",
              count: 3,
              images: [
                require("@/images/26.png"),
                require("@/images/39.png"),
                require("@/images/50.png"),
              ],
            },
            {
              name: "Headphones",
              count: 3,
              images: [
                require("@/images/8.png"),
                require("@/images/11.png"),
                require("@/images/29.png"),
              ],
            },
            {
              name: "Makeup",
              count: 1,
              images: [
                require("@/images/47.png"),
              ],
            },
            {
              name: "Necklace",
              count: 10,
              images: [
                require("@/images/1.png"),
                require("@/images/4.png"),
                require("@/images/15.png"),
                require("@/images/19.png"),
                require("@/images/22.png"),
                require("@/images/23.png"),
                require("@/images/27.png"),
                require("@/images/33.png"),
//              require("@/images/34.png"),
//              require("@/images/44.png"),
              ],
            },
            {
              name: "Necklace & bracelet",
              count: 5,
              images: [
                require("@/images/13.png"),
                require("@/images/18.png"),
                require("@/images/20.png"),
                require("@/images/30.png"),
                require("@/images/37.png"),
              ],
            },
           {
              name: "Scarf",
              count: 1,
              images: [
                require("@/images/17.png"),
              ],
            },
           {
              name: "Watch",
              count: 4,
              images: [
                require("@/images/14.png"),
                require("@/images/16.png"),
                require("@/images/25.png"),
                require("@/images/32.png"),
              ],
            },
          ],
        },
       {
          category: "Dress",
          total: 100,
          items: [
            {
              name: "Beach",
              count: 2,
              images: [
                require("@/images/35.png"),
                require("@/images/50.png"),
              ],
            },
            {
              name: "Casual",
              count: 19,
              images: [
                require("@/images/2.png"),
                require("@/images/8.png"),
                require("@/images/11.png"),
                require("@/images/12.png"),
                require("@/images/13.png"),
                require("@/images/21.png"),
                require("@/images/23.png"),
                require("@/images/26.png"),
 /*             require("@/images/28.png"),
                require("@/images/32.png"),
                require("@/images/34.png"),
                require("@/images/36.png"),
                require("@/images/38.png"),
                require("@/images/39.png"),
                require("@/images/42.png"),
                require("@/images/43.png"),
                require("@/images/44.png"),
                require("@/images/47.png"),
                require("@/images/45.png"),*/
              ],
            },
            {
              name: "Christmas",
              count: 1,
              images: [
                require("@/images/10.png"),
              ],
            },
            {
              name: "Party",
              count: 23,
              images: [
                require("@/images/1.png"),
                require("@/images/3.png"),
                require("@/images/4.png"),
                require("@/images/5.png"),
                require("@/images/6.png"),
                require("@/images/7.png"),
                require("@/images/9.png"),
                require("@/images/14.png"),
/*              require("@/images/15.png"),
                require("@/images/16.png"),
                require("@/images/18.png"),
                require("@/images/19.png"),
                require("@/images/20.png"),
                require("@/images/22.png"),
                require("@/images/27.png"),
                require("@/images/29.png"),
                require("@/images/30.png"),
                require("@/images/31.png"),
                require("@/images/33.png"),
                require("@/images/37.png"),
                require("@/images/40.png"),
                require("@/images/41.png"),
                require("@/images/48.png"),*/
              ],
            },
            {
              name: "Uniform",
              count: 2,
              images: [
                require("@/images/25.png"),
                require("@/images/46.png"),
              ],
            },
            {
              name: "Winter",
              count: 3,
              images: [
                require("@/images/17.png"),
                require("@/images/24.png"),
                require("@/images/49.png"),
              ],
            },
          ],
        },
      {
          category: "Standout",
          total: 100,
          items: [
            {
              name: "Barefoot",
              count: 2,
              images: [
                require("@/images/10.png"),
                require("@/images/50.png"),
              ],
            },
            {
              name: "Cap",
              count: 2,
              images: [
                require("@/images/27.png"),
                require("@/images/42.png"),
              ],
            },
            {
              name: "Eyebrows",
              count: 1,
              images: [
                require("@/images/20.png"),
              ],
            },
            {
              name: "Glasses",
              count: 9,
              images: [
                require("@/images/2.png"),
                require("@/images/8.png"),
                require("@/images/14.png"),
                require("@/images/18.png"),
                require("@/images/21.png"),
                require("@/images/25.png"),
                require("@/images/26.png"),
                require("@/images/37.png"),
 //             require("@/images/40.png"),
              ],
            },
            {
              name: "Glasses & Hair",
              count: 5,
              images: [
                require("@/images/16.png"),
                require("@/images/17.png"),
                require("@/images/28.png"),
                require("@/images/29.png"),
                require("@/images/32.png"),

              ],
            },
            {
              name: "Hair",
              count: 2,
              images: [
                require("@/images/11.png"),
                require("@/images/19.png"),
              ],
            },
            {
              name: "Hair & Clip",
              count: 1,
              images: [
                require("@/images/47.png"),
              ],
            },
            {
              name: "Hairclip",
              count: 1,
              images: [
                require("@/images/36.png"),
              ],
            },
            {
              name: "Hat",
              count: 2,
              images: [
                require("@/images/15.png"),
                require("@/images/44.png"),
              ],
            },
            {
              name: "Headband",
              count: 4,
              images: [
                require("@/images/7.png"),
                require("@/images/12.png"),
                require("@/images/13.png"),
                require("@/images/23.png"),
              ],
            },
            {
              name: "Headphones",
              count: 2,
              images: [
                require("@/images/34.png"),
                require("@/images/43.png"),
              ],
            },
            {
              name: "Makeup",
              count: 1,
              images: [
                require("@/images/4.png"),
              ],
            },
           {
              name: "Red Shoes",
              count: 1,
              images: [
                require("@/images/9.png"),
              ],
            },
           {
              name: "Scarf",
              count: 1,
              images: [
                require("@/images/49.png"),
              ],
            },
           {
              name: "Tie",
              count: 2,
              images: [
                require("@/images/41.png"),
                require("@/images/46.png"),
              ],
            },
           {
              name: "Waist chain",
              count: 1,
              images: [
                require("@/images/5.png"),
              ],
            },
          ],
        },
        {
          category: "Earrings",
          total: 100,
          items: [
            {
              name: "Double gold",
              count: 1,
              images: [
                require("@/images/27.png"),
              ],
            },
            {
              name: "Glasses",
              count: 3,
              images: [
                require("@/images/38.png"),
                require("@/images/43.png"),
                require("@/images/46.png"),
              ],
            },
            {
              name: "Gold & diamond",
              count: 2,
              images: [
                require("@/images/5.png"),
                require("@/images/26.png"),
              ],
            },
            {
              name: "Golden",
              count: 2,
              images: [
                require("@/images/28.png"),
                require("@/images/32.png"),
              ],
            },
            {
              name: "Golden flower",
              count: 1,
              images: [
                require("@/images/18.png"),
              ],
            },
            {
              name: "Ocean pearl",
              count: 1,
              images: [
                require("@/images/30.png"),
              ],
            },
            {
              name: "Pearl",
              count: 6,
              images: [
                require("@/images/3.png"),
                require("@/images/21.png"),
                require("@/images/22.png"),
                require("@/images/25.png"),
                require("@/images/33.png"),
                require("@/images/44.png"),
              ],
            },
            {
              name: "Pink pearl",
              count: 1,
              images: [
                require("@/images/35.png"),
              ],
            },
            {
              name: "Pink studs",
              count: 1,
              images: [
                require("@/images/17.png"),
              ],
            },
          ],
        },
        {
          category: "Color",
          total: 100,
          items: [
            {
              name: "Black",
              count: 4,
              images: [
                require("@/images/14.png"),
                require("@/images/41.png"),
                require("@/images/46.png"),
                require("@/images/22.png"),
              ],
            },
            {
              name: "Blue",
              count: 4,
              images: [
                require("@/images/16.png"),
                require("@/images/25.png"),
                require("@/images/28.png"),
                require("@/images/38.png"),
              ],
            },
            {
              name: "Cyan",
              count: 2,
              images: [
                require("@/images/31.png"),
                require("@/images/48.png"),
              ],
            },
            {
              name: "Green",
              count: 9,
              images: [
                require("@/images/1.png"),
                require("@/images/12.png"),
                require("@/images/15.png"),
                require("@/images/19.png"),
                require("@/images/24.png"),
                require("@/images/37.png"),
                require("@/images/42.png"),
                require("@/images/44.png"),
 //             require("@/images/49.png"),
              ],
            },
            {
              name: "Orange",
              count: 3,
              images: [
                require("@/images/2.png"),
                require("@/images/10.png"),
                require("@/images/27.png"),
              ],
            },
            {
              name: "Pink",
              count: 13,
              images: [
                require("@/images/4.png"),
                require("@/images/5.png"),
                require("@/images/17.png"),
                require("@/images/23.png"),
                require("@/images/26.png"),
                require("@/images/29.png"),
                require("@/images/30.png"),
                require("@/images/35.png"),
 /*             require("@/images/40.png"),
                require("@/images/43.png"),
                require("@/images/45.png"),
                require("@/images/47.png"),
                require("@/images/50.png"),*/
              ],
            },
            {
              name: "Purple",
              count: 3,
              images: [
                require("@/images/6.png"),
                require("@/images/11.png"),
                require("@/images/32.png"),
              ],
            },
            {
              name: "Rainbow",
              count: 2,
              images: [
                require("@/images/7.png"),
                require("@/images/8.png"),
              ],
            },
            {
              name: "Red",
              count: 2,
              images: [
                require("@/images/9.png"),
                require("@/images/33.png"),
              ],
            },
            {
              name: "Skyblue",
              count: 1,
              images: [
                require("@/images/39.png"),
              ],
            },
            {
              name: "Violet",
              count: 2,
              images: [
                require("@/images/13.png"),
                require("@/images/34.png"),
              ],
            },
            {
              name: "White",
              count: 2,
              images: [
                require("@/images/3.png"),
                require("@/images/21.png"),
              ],
            },
            {
              name: "Yellow",
              count: 3,
              images: [
                require("@/images/18.png"),
                require("@/images/20.png"),
                require("@/images/36.png"),
              ],
            },
          ],
        },
      ],
    };
  },
};
</script>

<style scoped>
.img-attrb {
  object-fit: contain !important;
  width: 50px;
  height: 50px;
  margin: 2px;
}

.imgRow {
  padding: 16px;
  padding-top: 4px;
}

.category {
  padding-bottom: 10px;
}

.img-attrb {
  width:70px;
  height:70px;
  opacity: .8;
}
</style>