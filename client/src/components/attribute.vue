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
<!--          <img
            v-for="(img, i_idx) in cat.images"
            :key="'img' + i_idx"
            :src="img"
            class="img-attrb"
          />-->
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
              name: "Air Pods",
              count: 1,
              images: [
                require("@/images/88.png"),
              ],
            },
            {
              name: "Covid Mask",
              count: 4,
              images: [
                require("@/images/79.png"),
                require("@/images/82.png"),
                require("@/images/94.png"),
                require("@/images/98.png"),
              ],
            },
            {
              name: "Crown",
              count: 5,
              images: [
                require("@/images/24.png"),
                require("@/images/26.png"),
                require("@/images/34.png"),
                require("@/images/57.png"),
                require("@/images/72.png"),
              ],
            },
            {
              name: "Horns",
              count: 9,
              images: [
                require("@/images/1.png"),
                require("@/images/9.png"),
                require("@/images/10.png"),
                require("@/images/16.png"),
                require("@/images/44.png"),
                require("@/images/45.png"),
                require("@/images/49.png"),
                require("@/images/67.png"),
                require("@/images/95.png"),
              ],
            },
            {
              name: "Rainbow",
              count: 3,
              images: [
                require("@/images/8.png"),
                require("@/images/33.png"),
                require("@/images/86.png"),
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
              count: 6,
              images: [
                require("@/images/26.png"),
                require("@/images/34.png"),
                require("@/images/49.png"),
                require("@/images/31.png"),
                require("@/images/38.png"),
                require("@/images/97.png"),
              ],
            },
            {
              name: "Glasses",
              count: 7,
              images: [
                require("@/images/6.png"),
                require("@/images/8.png"),
                require("@/images/12.png"),
                require("@/images/28.png"),
                require("@/images/43.png"),
                require("@/images/51.png"),
                require("@/images/55.png"),
                require("@/images/56.png"),
/*                require("@/images/87.png"),
                require("@/images/89.png"),
                require("@/images/99.png"),
                require("@/images/100.png"),
                require("@/images/77.png"),
                require("@/images/82.png"),
                require("@/images/61.png"),*/
              ],
            },
           {
              name: "Hair",
              count: 1,
              images: [
                require("@/images/28.png"),
              ],
            },
           {
              name: "Hairclip",
              count: 1,
              images: [
                require("@/images/47.png"),
              ],
            },
            {
              name: "Hat",
              count: 3,
              images: [
                require("@/images/52.png"),
                require("@/images/69.png"),
                require("@/images/92.png"),
              ],
            },
            {
              name: "Headband",
              count: 3,
              images: [
                require("@/images/6.png"),
                require("@/images/11.png"),
                require("@/images/62.png"),
              ],
            },
            {
              name: "Headphones",
              count: 4,
              images: [
                require("@/images/29.png"),
                require("@/images/39.png"),
                require("@/images/43.png"),
                require("@/images/8.png"),
              ],
            },
            {
              name: "Necklace",
              count: 29,
              images: [
                require("@/images/1.png"),
                require("@/images/94.png"),
                require("@/images/24.png"),
                require("@/images/72.png"),
                require("@/images/16.png"),
                require("@/images/44.png"),
                require("@/images/95.png"),
                require("@/images/2.png"),
//              require("@/images/4.png"),
//              require("@/images/5.png"),
              ],
            },
            {
              name: "Necklace & bracelet",
              count: 5,
              images: [
                require("@/images/13.png"),
                require("@/images/23.png"),
                require("@/images/37.png"),
                require("@/images/58.png"),
                require("@/images/60.png"),
              ],
            },
           {
              name: "Scarf",
              count: 9,
              images: [
                require("@/images/98.png"),
                require("@/images/3.png"),
                require("@/images/48.png"),
                require("@/images/53.png"),
                require("@/images/54.png"),
                require("@/images/68.png"),
                require("@/images/81.png"),
                require("@/images/83.png"),
                require("@/images/90.png"),
              ],
            },
           {
              name: "Singing",
              count: 2,
              images: [
                require("@/images/25.png"),
                require("@/images/71.png"),
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
              name: "Watch",
              count: 4,
              images: [
                require("@/images/88.png"),
                require("@/images/14.png"),
                require("@/images/32.png"),
                require("@/images/65.png"),
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
              count: 6,
              images: [
                require("@/images/87.png"),
                require("@/images/100.png"),
                require("@/images/52.png"),
                require("@/images/92.png"),
                require("@/images/62.png"),
                require("@/images/35.png"),
              ],
            },
            {
              name: "Casual",
              count: 33,
              images: [
                require("@/images/38.png"),
                require("@/images/89.png"),
                require("@/images/28.png"),
                require("@/images/47.png"),
                require("@/images/6.png"),
                require("@/images/11.png"),
                require("@/images/39.png"),
                require("@/images/43.png"),
              ],
            },
           {
              name: "Chef",
              count: 1,
              images: [
                require("@/images/97.png"),
              ],
            },
            {
              name: "Christmas",
              count: 2,
              images: [
                require("@/images/10.png"),
                require("@/images/83.png"),
              ],
            },
             {
              name: "Detective",
              count: 1,
              images: [
                require("@/images/99.png"),
              ],
            },
            {
              name: "Party",
              count: 44,
              images: [
                require("@/images/26.png"),
                require("@/images/34.png"),
                require("@/images/49.png"),
                require("@/images/31.png"),
                require("@/images/51.png"),
                require("@/images/55.png"),
                require("@/images/56.png"),
                require("@/images/69.png"),
              ],
            },
            {
              name: "Uniform",
              count: 2,
              images: [
                require("@/images/46.png"),
                require("@/images/65.png"),
              ],
            },
            {
              name: "Winter",
              count: 11,
              images: [
                require("@/images/80.png"),
                require("@/images/22.png"),
                require("@/images/64.png"),
                require("@/images/70.png"),
                require("@/images/85.png"),
                require("@/images/98.png"),
                require("@/images/3.png"),
                require("@/images/48.png"),
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
              count: 5,
              images: [
                require("@/images/100.png"),
                require("@/images/52.png"),
                require("@/images/92.png"),
                require("@/images/62.png"),
                require("@/images/10.png"),
              ],
            },
            {
              name: "Glasses & Hair",
              count: 3,
              images: [
                require("@/images/48.png"),
                require("@/images/29.png"),
                require("@/images/32.png"),

              ],
            },
            {
              name: "Hair",
              count: 7,
              images: [
                require("@/images/47.png"),
                require("@/images/39.png"),
                require("@/images/20.png"),
                require("@/images/69.png"),
                require("@/images/44.png"),
                require("@/images/59.png"),
                require("@/images/67.png"),
              ],
            },
            {
              name: "Hairband",
              count: 1,
              images: [
                require("@/images/95.png"),
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
              count: 29,
              images: [
                require("@/images/87.png"),
                require("@/images/89.png"),
                require("@/images/4.png"),
                require("@/images/18.png"),
                require("@/images/42.png"),
                require("@/images/88.png"),
                require("@/images/97.png"),
                require("@/images/83.png"),
                require("@/images/99.png"),
              ],
            },
            {
              name: "Headband",
              count: 4,
              images: [
                require("@/images/38.png"),
                require("@/images/63.png"),
                require("@/images/13.png"),
                require("@/images/33.png"),
              ],
            },
            {
              name: "Headphones",
              count: 1,
              images: [
                require("@/images/5.png"),
              ],
            },
            {
              name: "Love",
              count: 1,
              images: [
                require("@/images/93.png"),
              ],
            },

           {
              name: "Teeth",
              count: 5,
              images: [
                require("@/images/73.png"),
                require("@/images/74.png"),
                require("@/images/1.png"),
                require("@/images/75.png"),
                require("@/images/80.png"),
              ],
            },
           {
              name: "Waist chain",
              count: 1,
              images: [
                require("@/images/34.png"),
              ],
            },
          ],
        },
        {
          category: "Earrings",
          total: 100,
          items: [
            {
              name: "Diamond",
              count: 5,
              images: [
                require("@/images/2.png"),
                require("@/images/6.png"),
                require("@/images/74.png"),
                require("@/images/84.png"),
                require("@/images/73.png"),
              ],
            },
            {
              name: "Gold",
              count: 16,
              images: [
                require("@/images/28.png"),
                require("@/images/58.png"),
                require("@/images/19.png"),
                require("@/images/32.png"),
                require("@/images/48.png"),
                require("@/images/20.png"),
                require("@/images/97.png"),
                require("@/images/27.png"),
              ],
            },
            {
              name: "Pearl",
              count: 12,
              images: [
                require("@/images/61.png"),
                require("@/images/65.png"),
                require("@/images/4.png"),
                require("@/images/93.png"),
                require("@/images/35.png"),
                require("@/images/16.png"),
                require("@/images/49.png"),
                require("@/images/7.png"),
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
              count: 9,
              images: [
                require("@/images/14.png"),
                require("@/images/73.png"),
                require("@/images/74.png"),
                require("@/images/46.png"),
                require("@/images/89.png"),
                require("@/images/51.png"),
                require("@/images/41.png"),
                require("@/images/1.png"),
              ],
            },
            {
              name: "Blue",
              count: 6,
              images: [
                require("@/images/28.png"),
                require("@/images/12.png"),
                require("@/images/56.png"),
                require("@/images/81.png"),
                require("@/images/70.png"),
                require("@/images/65.png"),
              ],
            },
            {
              name: "Brown",
              count: 1,
              images: [
                require("@/images/99.png"),
              ],
            },
              {
              name: "Cyan",
              count: 4,
              images: [
                require("@/images/97.png"),
                require("@/images/72.png"),
                require("@/images/31.png"),
                require("@/images/57.png"),
              ],
            },
            {
              name: "Green",
              count: 18,
              images: [
                require("@/images/74.png"),
                require("@/images/20.png"),
                require("@/images/96.png"),
                require("@/images/37.png"),
                require("@/images/59.png"),
                require("@/images/42.png"),
                require("@/images/15.png"),
                require("@/images/40.png"),
              ],
            },
            {
              name: "Orange",
              count: 5,
              images: [
                require("@/images/78.png"),
                require("@/images/10.png"),
                require("@/images/82.png"),
                require("@/images/90.png"),
                require("@/images/93.png"),
              ],
            },
            {
              name: "Pink",
              count: 21,
              images: [
                require("@/images/6.png"),
                require("@/images/84.png"),
                require("@/images/71.png"),
                require("@/images/23.png"),
                require("@/images/75.png"),
                require("@/images/34.png"),
                require("@/images/100.png"),
                require("@/images/62.png"),
              ],
            },
            {
              name: "Purple",
              count: 5,
              images: [
                require("@/images/2.png"),
                require("@/images/32.png"),
                require("@/images/39.png"),
                require("@/images/26.png"),
                require("@/images/21.png"),
              ],
            },
            {
              name: "Rainbow",
              count: 5,
              images: [
                require("@/images/8.png"),
                require("@/images/69.png"),
                require("@/images/67.png"),
                require("@/images/86.png"),
                require("@/images/33.png"),
              ],
            },
            {
              name: "Red",
              count: 7,
              images: [
                require("@/images/48.png"),
                require("@/images/83.png"),
                require("@/images/17.png"),
                require("@/images/98.png"),
                require("@/images/53.png"),
                require("@/images/7.png"),
                require("@/images/9.png"),
              ],
            },
            {
              name: "Skyblue",
              count: 4,
              images: [
                require("@/images/88.png"),
                require("@/images/22.png"),
                require("@/images/11.png"),
                require("@/images/16.png"),
              ],
            },
            {
              name: "Violet",
              count: 4,
              images: [
                require("@/images/87.png"),
                require("@/images/68.png"),
                require("@/images/13.png"),
                require("@/images/5.png"),
              ],
            },
            {
              name: "White",
              count: 4,
              images: [
                require("@/images/19.png"),
                require("@/images/27.png"),
                require("@/images/61.png"),
                require("@/images/49.png"),
              ],
            },
            {
              name: "Yellow",
              count: 7,
              images: [
                require("@/images/24.png"),
                require("@/images/58.png"),
                require("@/images/76.png"),
                require("@/images/52.png"),
                require("@/images/92.png"),
                require("@/images/36.png"),
                require("@/images/60.png"),
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