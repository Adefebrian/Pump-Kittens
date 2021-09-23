<template>
    <div>
        <v-btn color="black" dark @click.stop="dialog = true"  outlined elevation="4" class="action" x-small>Send</v-btn>
        <v-dialog v-model="dialog" max-width="450">
            <v-card>
                <v-toolbar color="primary" dark>Send your Pumpkitten to:</v-toolbar>
                <div class="text-h10 my-3 mx-3">{{this.name}}</div>
                <v-col sm="15">
                   <v-text-field v-model="recipientAddress" placeholder="To : Enter recipients address">
                    </v-text-field>
                </v-col>
                <v-card-actions>
                    <v-spacer></v-spacer>
                    <v-btn @click="transferToken" color="green darken-1" text>
                    Send
                    </v-btn>
                   <v-btn color="green darken-1" text @click="dialog = false">
                    Close
                    </v-btn>
                </v-card-actions>
            </v-card>
        </v-dialog>
    </div>
</template>
<script>
  export default {
    data () {
      return {
        dialog: false,
        recipientAddress: null,
        transfered: false,
        error: false
      }
    },
    props: {
        id: {type: String},
        name: {type: String},
        account: null
    },
    mounted() {
    },
    unmounted() {
    },
    watch:{
        dialog:function(newValue){
            if(!newValue){
                this.research();
                this.transfered = false;
            }
        }
    },
    methods: {
        transferToken() {         
            if (this.$store.dispatch('transferToken', {
                tokenID:this.id,
                from:this.account,
                to:this.recipientAddress
            }))
            this.transfered = true;
        },
        async research() {
            if (this.transfered)
            {
                try {
                    await this.$store.dispatch('getTokenIdsOfOwner', {
                        account:this.account
                    })

                    await this.$store.dispatch('constructTokenInfo', {
                        account:this.account
                    })
                }
                catch (e) {
                    this.error = e;
                }
            }
        }
    }
  }
</script>